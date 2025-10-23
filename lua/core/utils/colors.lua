-- Color utility functions

local M = {}

--- Load wallust colors from cache
--- @return table|nil colors Color table with background, foreground, color0-15, or nil if file not found
function M.load_wallust_colors()
  local colors_file = vim.fn.expand("~/.cache/wallust/neovim.lua")

  -- Check if file exists
  if vim.fn.filereadable(colors_file) == 0 then
    vim.notify("wallust colors file not found: " .. colors_file, vim.log.levels.WARN)
    return nil
  end

  -- Load the Lua file directly (fast!)
  local ok, colors = pcall(dofile, colors_file)
  if not ok then
    vim.notify("Failed to load wallust colors: " .. tostring(colors), vim.log.levels.ERROR)
    return nil
  end

  return colors
end

return M
