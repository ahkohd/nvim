-- luacheck: globals vim

return {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<space>g", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit" },
	},
}
