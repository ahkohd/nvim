-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"mellow-theme/mellow.nvim",
		"maxmx03/solarized.nvim",
		"kepano/flexoki-neovim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("themery").setup({
			themeConfigFile = "~/.config/nvim/lua/theme.lua",
			themes = {
				{
					name = "Solarized dark",
					colorscheme = "solarized",
					before = [[
            vim.opt.background = "dark"
          ]],
				},
				{
					name = "Solarized light",
					colorscheme = "solarized",
					before = [[
            vim.opt.background = "light"
          ]],
				},
				{
					name = "Mellow",
					colorscheme = "mellow",
				},
				{
					name = "Felxoki Dark",
					colorscheme = "flexoki-dark",
				},
				{
					name = "Felxoki Light",
					colorscheme = "flexoki-light",
				},
			},
		})

		require("theme")
	end,
}
