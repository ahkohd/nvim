-- Inspect highlight under cursor
-- Usage: :InspectHighlight or <leader>dh

local M = {}

-- Highlight hex colors in buffer with contrast text
local function highlight_hex_colors(buf, lines)
  for i, line in ipairs(lines) do
    for hex in line:gmatch("#%x%x%x%x%x%x") do
      local start_col = line:find(hex, 1, true) - 1
      local end_col = start_col + #hex
      local hl_group = "HexColor" .. hex:sub(2):upper()

      -- Calculate luminance to determine if we need light or dark text
      local r = tonumber(hex:sub(2, 3), 16) / 255
      local g = tonumber(hex:sub(4, 5), 16) / 255
      local b = tonumber(hex:sub(6, 7), 16) / 255

      -- Calculate relative luminance (simplified)
      local luminance = 0.299 * r + 0.587 * g + 0.114 * b
      local text_color = luminance > 0.5 and "#000000" or "#FFFFFF"

      -- Create highlight group with the hex color background and contrasting text
      vim.api.nvim_set_hl(0, hl_group, { fg = text_color, bg = hex })

      -- Apply highlight to the hex code
      vim.api.nvim_buf_add_highlight(buf, -1, hl_group, i - 1, start_col, end_col)
    end
  end
end

function M.inspect()
  local line = vim.fn.line('.') - 1  -- 0-indexed
  local col = vim.fn.col('.') - 1    -- 0-indexed
  local bufnr = vim.api.nvim_get_current_buf()

  local lines = {}
  table.insert(lines, "=== Highlight at line " .. (line + 1) .. ", col " .. (col + 1) .. " ===")
  table.insert(lines, "")

  local found = false

  -- First, check for treesitter highlighting
  local ts_hl = vim.treesitter.get_captures_at_pos(bufnr, line, col)
  if #ts_hl > 0 then
    for _, capture in ipairs(ts_hl) do
      found = true
      local hl_group = "@" .. capture.capture
      table.insert(lines, "Treesitter: " .. capture.capture)
      table.insert(lines, "Highlight group: " .. hl_group)

      -- Get the actual highlight properties
      local hl = vim.api.nvim_get_hl(0, {name = hl_group, link = false})

      if hl.fg then
        table.insert(lines, string.format("  fg = #%06x", hl.fg))
      end
      if hl.bg then
        table.insert(lines, string.format("  bg = #%06x", hl.bg))
      end
      if hl.bold then table.insert(lines, "  bold = true") end
      if hl.italic then table.insert(lines, "  italic = true") end
      if hl.underline then table.insert(lines, "  underline = true") end

      -- Check if it's a link
      local link_hl = vim.api.nvim_get_hl(0, {name = hl_group, link = true})
      if link_hl.link then
        table.insert(lines, "  (links to: " .. link_hl.link .. ")")
      end

      table.insert(lines, "")
    end
  end

  -- Check for syntax highlighting
  local synID = vim.fn.synID(line + 1, col + 1, 1)
  if synID ~= 0 then
    local synName = vim.fn.synIDattr(synID, "name")
    if synName and synName ~= "" then
      found = true
      table.insert(lines, "Syntax: " .. synName)
      table.insert(lines, "Highlight group: " .. synName)

      -- Get the actual highlight properties
      local hl = vim.api.nvim_get_hl(0, {name = synName, link = false})

      if hl.fg then
        table.insert(lines, string.format("  fg = #%06x", hl.fg))
      end
      if hl.bg then
        table.insert(lines, string.format("  bg = #%06x", hl.bg))
      end
      if hl.bold then table.insert(lines, "  bold = true") end
      if hl.italic then table.insert(lines, "  italic = true") end
      if hl.underline then table.insert(lines, "  underline = true") end

      -- Check if it's a link
      local link_hl = vim.api.nvim_get_hl(0, {name = synName, link = true})
      if link_hl.link then
        table.insert(lines, "  (links to: " .. link_hl.link .. ")")
      end

      table.insert(lines, "")
    end
  end

  -- Get all namespaces to check for extmarks
  local namespaces = vim.api.nvim_get_namespaces()
  for name, ns_id in pairs(namespaces) do
    -- Get extmarks at this position
    local extmarks = vim.api.nvim_buf_get_extmarks(
      bufnr, ns_id,
      {line, 0}, {line, -1},
      {details = true}
    )

    for _, extmark in ipairs(extmarks) do
      local id, row, start_col, details = extmark[1], extmark[2], extmark[3], extmark[4]

      -- Check if cursor is within this extmark
      if details.end_col and col >= start_col and col < details.end_col then
        if details.hl_group then
          found = true
          table.insert(lines, "Namespace: " .. name)
          table.insert(lines, "Highlight group: " .. details.hl_group)

          -- Get the actual highlight properties
          local hl = vim.api.nvim_get_hl(0, {name = details.hl_group, link = false})

          if hl.fg then
            table.insert(lines, string.format("  fg = #%06x", hl.fg))
          end
          if hl.bg then
            table.insert(lines, string.format("  bg = #%06x", hl.bg))
          end
          if hl.bold then table.insert(lines, "  bold = true") end
          if hl.italic then table.insert(lines, "  italic = true") end
          if hl.underline then table.insert(lines, "  underline = true") end

          -- Check if it's a link
          local link_hl = vim.api.nvim_get_hl(0, {name = details.hl_group, link = true})
          if link_hl.link then
            table.insert(lines, "  (links to: " .. link_hl.link .. ")")
          end

          table.insert(lines, "")
        end
      end
    end
  end

  if not found then
    table.insert(lines, "No highlight found at cursor position")
    table.insert(lines, "")
    table.insert(lines, "Try running :highlight to see all highlights")
  end

  -- Display in a floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Highlight hex colors in the output
  highlight_hex_colors(buf, lines)

  vim.api.nvim_buf_set_option(buf, 'filetype', 'highlight-info')
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, #line)
  end
  width = math.min(width + 2, vim.o.columns - 4)
  local height = math.min(#lines, vim.o.lines - 4)

  -- Check if we're in a floating window
  local current_win = vim.api.nvim_get_current_win()
  local win_config = vim.api.nvim_win_get_config(current_win)
  local in_float = win_config.relative and win_config.relative ~= ''

  local opts = {
    relative = in_float and 'editor' or 'cursor',
    row = in_float and math.floor((vim.o.lines - height) / 2) or 1,
    col = in_float and math.floor((vim.o.columns - width) / 2) or 0,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
    zindex = 1000,
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, 'wrap', false)

  -- Close on any key press or when leaving the window
  vim.keymap.set('n', 'q', function() vim.api.nvim_win_close(win, true) end, { buffer = buf })
  vim.keymap.set('n', '<Esc>', function() vim.api.nvim_win_close(win, true) end, { buffer = buf })

  vim.api.nvim_create_autocmd({'BufLeave'}, {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
  })
end

-- List all highlight groups with color highlighting
function M.list_highlights()
  local output = vim.fn.execute("highlight")

  vim.cmd("new")
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, "Highlight Groups")
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "highlight-groups"

  local lines = vim.split(output, "\n")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  highlight_hex_colors(buf, lines)

  vim.bo[buf].modifiable = false
end

function M.setup()
  vim.api.nvim_create_user_command('InspectHighlight', M.inspect, {})
  vim.api.nvim_create_user_command('ListHighlights', M.list_highlights, {})
end

return M
