-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
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
					name = "Gruvbox (dark)",
					colorscheme = "gruvbox",
					before = [[
            vim.opt.background = "dark"

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
                transparent_mode = true,
            })
          ]],
				},
				{
					name = "Gruvbox (light)",
					colorscheme = "gruvbox",
					before = [[
            vim.opt.background = "light"

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
                transparent_mode = true,
            })
          ]],
				},
			},
		})

		require("theme")
	end,
}
