return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{ "<leader>g", "<cmd>lua Snacks.lazygit.open()<cr>", desc = "Toggle Lazygit" },
	},
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
	},
}
