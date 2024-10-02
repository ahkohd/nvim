-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"craftzdog/solarized-osaka.nvim",
		"lunacookies/vim-colors-xcode",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "xcode-dark",
					colorscheme = "xcodedark",
				},
				{
					name = "xcode-light",
					colorscheme = "xcodelight",
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
