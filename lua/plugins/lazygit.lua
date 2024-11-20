-- luacheck: globals vim

return {
	"kdheepak/lazygit.nvim",
	event = "LazyGit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<space>g", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit" },
	},
}
