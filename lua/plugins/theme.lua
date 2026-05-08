return {
	"everviolet/nvim",
	name = "evergarden",
	lazy = false,
	priority = 1000,
	config = function()
		require("evergarden").setup({
			theme = {
				variant = "winter",
				accent = "green",
			},
			editor = {
				sign = { color = "none" },
				float = {
					color = "mantle",
					solid_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
			style = {
				types = { "italic" },
				keyword = { "italic" },
				comment = { "italic" },
			},
			integrations = {
				blink_cmp = true,
				cmp = true,
				gitsigns = true,
				indent_blankline = { enable = true, scope_color = "green" },
				mini = { enable = true },
				neotree = true,
				telescope = true,
				which_key = true,
			},
		})
		vim.cmd("colorscheme evergarden")

		local function override_blink_hls()
			local border_fg = vim.api.nvim_get_hl(0, { name = "FloatBorder" }).fg
			local visual_bg = vim.api.nvim_get_hl(0, { name = "Visual" }).bg
			local menu_bg = vim.api.nvim_get_hl(0, { name = "BlinkCmpMenu" }).bg
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = border_fg, bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border_fg, bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = border_fg, bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = visual_bg })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = menu_bg })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_fg, bg = menu_bg })
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = menu_bg })

			for _, group in ipairs({
				"Normal",
				"NormalNC",
				"SignColumn",
				"EndOfBuffer",
				"LineNr",
				"CursorLineNr",
				"FoldColumn",
				"WinBar",
				"WinBarNC",
				"StatusLine",
				"StatusLineNC",
			}) do
				vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = group }), { bg = "NONE" }))
			end
		end
		vim.api.nvim_create_autocmd("ColorScheme", { callback = override_blink_hls })
		override_blink_hls()
	end,
}
