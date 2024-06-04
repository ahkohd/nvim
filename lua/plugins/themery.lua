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
		"miikanissi/modus-themes.nvim",
		"mhartington/oceanic-next",
		"whatyouhide/vim-gotham",
		"AlexvZyl/nordic.nvim",
		"ellisonleao/gruvbox.nvim",
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
				{
					name = "Modus Operandi",
					colorscheme = "modus_operandi",
				},
				{
					name = "Modus Vivendi",
					colorscheme = "modus_vivendi",
				},
				{
					name = "Oceanic next",
					colorscheme = "OceanicNext",
				},
				{
					name = "Oceanic next Light",
					colorscheme = "OceanicNextLight",
				},
				{
					name = "I'm Batman",
					colorscheme = "gotham",
				},
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
					name = "Gruvbox",
					colorscheme = "gruvbox",
					before = [[
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                  strings = true,
                  emphasis = true,
                  comments = true,
                  operators = false,
                  folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
