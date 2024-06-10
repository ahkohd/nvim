-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"AlexvZyl/nordic.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("themery").setup({
			themeConfigFile = "~/.config/nvim/lua/theme.lua",
			themes = {
				{
					name = "nordic.nvim",
					colorscheme = "nordic",
					before = [[
            require("nordic").setup({
               transparent_bg = true,
               bright_border = true
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
