-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"gbprod/nord.nvim",
		"atmosuwiryo/vim-winteriscoming",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("themery").setup({
			themeConfigFile = "~/.config/nvim/lua/theme.lua",
			themes = {
				{
					name = "nord.nvim",
					colorscheme = "nord",
					before = [[
            require("nord").setup({
               transparent = false
            })
          ]],
				},
				{
					name = "winter is coming (dark blue)",
					colorscheme = "WinterIsComing-dark-blue-color-no-italics-theme",
				},
				{
					name = "winter is coming (light)",
					colorscheme = "WinterIsComing-light-color-no-italics-theme",
				},
			},
		})

		require("theme")
	end,
}
