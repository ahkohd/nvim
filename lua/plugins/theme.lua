return {
	"typicode/bg.nvim",
	event = "BufEnter",
	dependencies = {
		{
			"LmanTW/themify.nvim",
			commit = "789c775",
			keys = {
				{
					"<leader>tc",
					function()
						local buffer_utils = require("core.utils.buffer")

						if buffer_utils.in_special_buffer() then
							return
						end
						vim.cmd("Themify")
					end,
					desc = "Theme",
				},
			},
			enabled = false,
			config = function()
				require("themify").setup({
					"monochrome",
					{
						"sainnhe/gruvbox-material",
						before = function()
							vim.g.gruvbox_material_foreground = "mix"
							vim.g.gruvbox_material_background = "hard"
							vim.g.gruvbox_material_ui_contrast = "high"
							vim.g.gruvbox_material_float_style = "blend"
							vim.g.gruvbox_material_statusline_style = "mix"
							vim.g.gruvbox_material_cursor = "auto"
							vim.g.gruvbox_material_visual = "blue background"
							vim.g.gruvbox_material_transparent_background = 1
						end,
						after = function()
							-- Color palette
							local bg = "#101114" -- #101114, NONE
							local surface = "#252529"
							local border = "#303034"

							-- Editor backgrounds
							local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
							vim.api.nvim_set_hl(0, "Normal", { fg = normal_hl.fg, bg = bg })
							vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
							vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
							vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
							vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })

							local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
							vim.api.nvim_set_hl(0, "StatusLine", { fg = comment_hl.fg, bg = bg })
							vim.api.nvim_set_hl(0, "StatusLineNC", { fg = comment_hl.fg, bg = bg })

							-- Window separators
							vim.api.nvim_set_hl(0, "VertSplit", { fg = border, bg = bg })
							vim.api.nvim_set_hl(0, "WinSeparator", { fg = border, bg = bg })

							-- Popup menu
							vim.api.nvim_set_hl(0, "Pmenu", { bg = bg })
							vim.api.nvim_set_hl(0, "PmenuSel", { bg = surface })
							vim.api.nvim_set_hl(0, "PmenuThumb", { bg = border })

							-- Floating window borders
							vim.api.nvim_set_hl(0, "FloatBorder", { fg = border, bg = bg })
							vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = border, bg = bg })

							-- Blink.cmp completion borders
							vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = border, bg = bg })
							vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border, bg = bg })
							vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = border, bg = bg })

							-- Markdown in completion docs
							vim.api.nvim_set_hl(0, "markdownRule", { fg = border })
							vim.api.nvim_set_hl(0, "markdownH1Delimiter", { fg = border })
							vim.api.nvim_set_hl(0, "markdownH2Delimiter", { fg = border })
							vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = border })

							-- Misc highlights
							vim.api.nvim_set_hl(0, "@spell", { link = "Comment" })
						end,
					},
				})
			end,
		},
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				transparent = not vim.g.neovide,
				borderless_pickers = false,
				overrides = function(colors)
					return {
						FloatBorder = { fg = colors.bg_alt },
						WinSeparator = { fg = colors.bg_alt },
						SnacksPickerTree = { fg = colors.bg_alt },
					}
				end,
			},
			config = function(_, opts)
				local theme_file = vim.fn.expand("~/.dotfiles/.theme")
				if vim.fn.filereadable(theme_file) == 1 then
					local content = vim.fn.readfile(theme_file)[1] or ""
					if content:match("dark") then
						opts.variant = "default"
					else
						opts.variant = "light"
					end
				else
					opts.variant = "auto"
				end
				require("cyberdream").setup(opts)
				vim.cmd("colorscheme cyberdream")
			end,
		},
	},
}
