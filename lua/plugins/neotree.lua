return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	lazy = false,
	keys = {
		{ mode = "n", "<space>e", "<cmd>:Neotree position=right<cr>", desc = "Neotree" },
	},
	branch = "v3.x",
	opts = {
		filesystem = {
			hijack_netrw_behavior = "open_current",
		},
	},
}
