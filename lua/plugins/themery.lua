-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"rktjmp/lush.nvim",
		"mellow-theme/mellow.nvim",
		"maxmx03/solarized.nvim",
		"kepano/flexoki-neovim",
		"aktersnurra/no-clown-fiesta.nvim",
		"embark-theme/vim",
		"folke/tokyonight.nvim",
		"Verf/deepwhite.nvim",
		"pineapplegiant/spaceduck",
		"nyngwang/nvimgelion",
		"yorickpeterse/vim-paper",
		"cseelus/vim-colors-lucid",
		"ribru17/bamboo.nvim",
		"rockyzhang24/arctic.nvim",
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
				{
					name = "No Clown Fiesta",
					colorscheme = "no-clown-fiesta",
				},
				{
					name = "Embark",
					colorscheme = "embark",
				},
				{
					name = "Tokyo Night / Night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "Tokyo Night / Storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "Tokyo Night / Day",
					colorscheme = "tokyonight-day",
				},
				{
					name = "Tokyo Night / Moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "DeepWhite",
					colorscheme = "deepwhite",
				},
				{ name = "SpaceDuck", colorscheme = "spaceduck" },
				{
					name = "Nvimgelion",
					colorscheme = "nvimgelion",
				},
				{
					name = "Vim Paper",
					colorscheme = "paper",
				},
				{
					name = "Lucid",
					colorscheme = "lucid",
				},
				{
					name = "Bamboo",
					colorscheme = "bamboo",
				},
				{
					name = "Arctic",
					colorscheme = "arctic",
				},
			},
		})

		require("theme")
	end,
}
