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
	end,
}
