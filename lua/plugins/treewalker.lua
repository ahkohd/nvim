return {
	"aaronik/treewalker.nvim",
	event = "VeryLazy",
	opts = { notifications = false },
	keys = {
		{ "<Down>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Down" },
		{ "<Up>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Up" },
		{ "<Left>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Left" },
		{ "<Right>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Right" },
		{ "<S-Down>", "<cmd>Treewalker SwapDown<cr>", mode = "n", silent = true, desc = "Treewalker Swap Down" },
		{ "<S-Up>", "<cmd>Treewalker SwapUp<cr>", mode = "n", silent = true, desc = "Treewalker Swap Up" },
		{ "<S-Left>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true, desc = "Treewalker Swap Left" },
		{ "<S-Right>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true, desc = "Treewalker Swap Right" },
	},
}
