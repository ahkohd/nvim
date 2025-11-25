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
							vim.api.nvim_set_hl(0, "Normal", { bg = bg })
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
	},
}
