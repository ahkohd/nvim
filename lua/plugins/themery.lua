-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"gbprod/nord.nvim",
		"AlexvZyl/nordic.nvim",
		"rmehri01/onenord.nvim",
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
					name = "nordic.nvim",
					colorscheme = "nordic",
					before = [[
            require("nordic").setup({
               transparent_bg = false,
               bright_border = false
            })
          ]],
				},
				{
					name = "onenord.nvim",
					colorscheme = "onenord",
					before = [[
            require("onenord").setup({
               disable = {
                background = true,
                float_background = true,
                cursorline = false
               },
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
