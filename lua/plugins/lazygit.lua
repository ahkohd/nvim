-- luacheck: globals vim

return {
	"kdheepak/lazygit.nvim",
	cmd = "LazyGit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>g", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit" },
	},
}
