-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"gbprod/nord.nvim",
		"atmosuwiryo/vim-winteriscoming",
		"craftzdog/solarized-osaka.nvim",
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
					name = "solarized-osaka",
					colorscheme = "solarized-osaka",
					before = [[
            require("solarized-osaka").setup({
               transparent = false
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
