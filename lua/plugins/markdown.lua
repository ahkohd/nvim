-- local md_path = vim.fn.expand("~") .. "/Documents/md"

return {
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		opts = {},
		config = function(_, opts)
			require("markdown-plus").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
				end,
			})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = function()
			local presets = require("markview.presets")

			-- Create custom bold highlight group for all headings
			vim.api.nvim_set_hl(0, "MarkdownHeadingBold", {
				fg = vim.api.nvim_get_hl(0, { name = "Constant" }).fg,
				bold = true,
			})

			-- Create custom highlight group for code blocks with transparent bg
			vim.api.nvim_set_hl(0, "MarkviewCodeTransparent", {
				bg = "NONE",
			})

			-- Custom list preset with bullet symbol
			local custom_list_items = {
				enable = true,
				shift_width = 0,
				marker_minus = {
					text = "•",
					hl = "MarkviewListItemMinus",
				},
				marker_plus = {
					text = "•",
					hl = "MarkviewListItemPlus",
				},
				marker_star = {
					text = "•",
					hl = "MarkviewListItemStar",
				},
			}

			-- Custom code block configuration
			local custom_code_blocks = {
				enable = true,
				style = "simple",
				min_width = 10,
				pad_amount = 0,
				label_direction = "left",
				sign = false,
				border_hl = "MarkviewCodeTransparent",
				info_hl = "MarkviewCodeTransparent",
				default = {
					block_hl = "MarkviewCodeTransparent",
					pad_hl = "MarkviewCodeTransparent",
				},
				["string"] = {
					block_hl = "MarkviewCodeTransparent",
					pad_hl = "MarkviewCodeTransparent",
				},
			}

			-- Custom heading preset
			local custom_headings = {
				enable = true,
				shift_width = 0,
				heading_1 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = "",
					icon_hl = "MarkdownHeadingBold",
				},
				heading_2 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = " ",
					icon_hl = "MarkdownHeadingBold",
				},
				heading_3 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = "  ",
				},
				heading_4 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = "   ",
					icon_hl = "MarkdownHeadingBold",
				},
				heading_5 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = "    ",
					icon_hl = "MarkdownHeadingBold",
				},
				heading_6 = {
					style = "label",
					align = "left",
					hl = "MarkdownHeadingBold",
					icon = "     ",
					icon_hl = "MarkdownHeadingBold",
				},
			}

			local config = vim.tbl_deep_extend("force", presets.no_nerd_fonts, {
				preview = {
					icon_provider = "internal",
				},
				markdown = {
					checkboxes = {
						enable = true,
					},
					list_items = custom_list_items,
					headings = custom_headings,
					code_blocks = custom_code_blocks,
					horizontal_rules = presets.horizontal_rules.thin,
					tables = presets.tables.rounded,
				},
			})
			return config
		end,
	},
}
