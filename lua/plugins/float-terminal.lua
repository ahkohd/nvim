-- luacheck: globals vim

return {
  dir = "~/.config/nvim/lua/plugins",
  cmd = "FloatTerminal",
  keys = {
    {
      "<C-;>",
      function()
        if _G.FloatTerminal then
          _G.FloatTerminal.toggle_terminal(1)
        end
      end,
      desc = "Toggle floating terminal 1",
      mode = { "n", "t" },
    },
    {
      "<C-'>",
      function()
        if _G.FloatTerminal then
          _G.FloatTerminal.toggle_terminal(2)
        end
      end,
      desc = "Toggle floating terminal 2",
      mode = { "n", "t" },
    },
  },
  opts = {
    width = nil,
    height = nil,
    exclusive = true, -- when true, only one terminal can be visible at a time
    terminals = {
      { id = 1, cmd = nil }, -- default shell
      { id = 2, cmd = nil }, -- default shell
    },
  },
  config = function(_, opts)
    local state = {
      terminals = {},
    }

    local function create_floating_window(opts)
      opts = opts or {}
      local width = opts.width or math.floor(vim.o.columns * 0.8)
      local height = opts.height or math.floor(vim.o.lines * 0.8)

      -- calculate the position to center the window
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)

      -- create a buffer
      local buf = nil
      if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
      else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
      end

      local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
      }

      -- create the floating window
      local win = vim.api.nvim_open_win(buf, true, win_config)

      return { buf = buf, win = win }
    end

    local function hide_other_terminals(current_id)
      for term_id, term in pairs(state.terminals) do
        if term_id ~= current_id and vim.api.nvim_win_is_valid(term.win) then
          vim.api.nvim_win_hide(term.win)
        end
      end
    end

    local function toggle_terminal(id, shell_cmd)
      id = id or 1

      -- Initialize terminal state if it doesn't exist
      if not state.terminals[id] then
        state.terminals[id] = {
          buf = -1,
          win = -1,
          cmd = shell_cmd,
        }
      end

      local term = state.terminals[id]

      if not vim.api.nvim_win_is_valid(term.win) then
        -- Hide other terminals if exclusive mode is enabled
        if opts.exclusive then
          hide_other_terminals(id)
        end
        local result = create_floating_window({ buf = term.buf })
        term.buf = result.buf
        term.win = result.win

        if vim.bo[term.buf].buftype ~= "terminal" then
          if term.cmd then
            vim.cmd("terminal " .. term.cmd)
          else
            vim.cmd.terminal()
          end

          vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {
            buffer = term.buf,
            noremap = true,
            silent = true,
            desc = "Exit terminal mode",
          })
        end

        vim.cmd("startinsert")
      else
        vim.api.nvim_win_hide(term.win)
      end
    end

    -- Initialize terminals from opts
    if opts.terminals then
      for _, terminal in ipairs(opts.terminals) do
        if terminal.id and terminal.cmd then
          state.terminals[terminal.id] = {
            buf = -1,
            win = -1,
            cmd = terminal.cmd,
          }
        end
      end
    end

    -- Store the toggle_terminal function globally for access from keybindings
    _G.FloatTerminal = {
      toggle_terminal = toggle_terminal
    }

    vim.api.nvim_create_user_command("FloatTerminal", function()
      toggle_terminal(1)
    end, {})

    vim.api.nvim_create_autocmd("TermEnter", {
      pattern = "*",
      callback = function()
        vim.opt_local.mouse = ""
      end,
    })
  end,
}
