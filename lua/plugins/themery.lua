-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"gbprod/nord.nvim",
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
					name = "solarized-osaka",
					colorscheme = "solarized-osaka",
					before = [[
            require("solarized-osaka").setup({
               transparent = false
            })
          ]],
				},
				{
					name = "solarized-osaka (transparent)",
					colorscheme = "solarized-osaka",
					before = [[
            require("solarized-osaka").setup({
               transparent = true
            })
          ]],
				},
				{
					name = "solarized-osaka-day",
					colorscheme = "solarized-osaka-day",
				},
			},
		})

		require("theme")
	end,
}
