-- luacheck: globals vim

local is_linux = vim.loop.os_uname().sysname == "Linux"

return {
	"typicode/bg.nvim",
  event = "BufEnter",
	dependencies = {
    {
    "sainnhe/gruvbox-material",
      config = function()
        if is_linux then
          vim.g.gruvbox_material_transparent_background = 1
        end
        vim.g.gruvbox_material_foreground = "mix"
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_ui_contrast = "high"
        vim.g.gruvbox_material_float_style = "bright"
        vim.g.gruvbox_material_statusline_style = "mix"
        vim.g.gruvbox_material_cursor = "auto"
        vim.cmd.colorscheme("gruvbox-material")
      end,
    },
	},
}
