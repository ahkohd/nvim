return {
	"aaronik/treewalker.nvim",
	event = "VeryLazy",
	opts = { notifications = false },
	keys = {
		{ "<c-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Down" },
		{ "<c-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Up" },
		{ "<c-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Left" },
		{ "<c-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true, desc = "Treewalker Right" },
		{ "<c-s-k>", "<cmd>Treewalker SwapUp<cr>", mode = "n", silent = true, desc = "Treewalker Swap Up" },
		{ "<c-s-j>", "<cmd>Treewalker SwapDown<cr>", mode = "n", silent = true, desc = "Treewalker Swap Down" },
		{ "<c-s-h>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true, desc = "Treewalker Swap Left" },
		{ "<c-s-l>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true, desc = "Treewalker Swap Right" },
	},
}
