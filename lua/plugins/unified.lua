return {
	"axkirillov/unified.nvim",
	cmd = "Unified",
	keys = {
		{
			"<leader>gd",
			"<cmd>Unified<cr>",
			desc = "Show inline diff",
		},
		{
			"<leader>gD",
			"<cmd>Unified reset<cr>",
			desc = "Hide inline diff",
		},
	},
	opts = {},
}
