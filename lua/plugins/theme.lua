-- luacheck: globals vim

return {
	"typicode/bg.nvim",
	event = "BufEnter",
	dependencies = {
		{
			"LmanTW/themify.nvim",
			commit = "789c775",
			keys = {
				{
					"<leader>tc",
					function()
						local buffer_utils = require("core.utils.buffer")

						if buffer_utils.in_special_buffer() then
							return
						end
						vim.cmd("Themify")
					end,
					desc = "Theme",
				},
			},
			config = function()
				require("themify").setup({
					"folke/tokyonight.nvim",
					"monochrome",
					"projekt0n/github-nvim-theme",
					"everviolet/nvim",
					"Mofiqul/vscode.nvim",
					{
						"sainnhe/gruvbox-material",
						before = function()
							vim.g.gruvbox_material_foreground = "mix"
							vim.g.gruvbox_material_background = "hard"
							vim.g.gruvbox_material_ui_contrast = "high"
							vim.g.gruvbox_material_float_style = "bright"
							vim.g.gruvbox_material_statusline_style = "mix"
							vim.g.gruvbox_material_cursor = "auto"
							vim.g.gruvbox_material_transparent_background = 1
							vim.g.gruvbox_material_visual = "blue background"
						end,
					},
				})
			end,
		},
	},
}
