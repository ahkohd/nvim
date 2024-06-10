-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
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
					name = "nordic.nvim",
					colorscheme = "nordic",
					before = [[
            require("nordic").setup({
               transparent_bg = true,
               bright_border = true
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
                cursorline = true
               },
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
