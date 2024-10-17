return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{ "<space>ck", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to Previous diagnostic" },
		{ "<space>cj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to Next diagnostic" },
	},
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				enable = false,
			},
		})
	end,
}
