-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"folke/tokyonight.nvim",
	},
	lazy = false,
	priority = 1000,
	keys = {
		{
			"<space>v",
			"<cmd>Themery<cr>",
			desc = "Theme",
		},
	},
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "tokyonight-moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "tokyonight-storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "tokyonight-night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "tokyonight-day",
					colorscheme = "tokyonight-day",
				},
			},
		})

		vim.cmd("colorscheme tokyonight-storm")
	end,
}
