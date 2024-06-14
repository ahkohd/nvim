-- luacheck: globals vim

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			w = { "<cmd>w<cr>", "Save" },
			Q = { "<cmd>qa!<cr>", "Quit" },
			v = { "<cmd>Themery<cr>", "Quit" },
			s = {
				name = "Find and Replace",
			},
			d = {
				name = "Diagnostics",
			},
			g = { "<cmd>LazyGit<cr>", "LazyGit" },
			b = {
				name = "Debug",
			},
			t = {
				name = "Tests",
			},
			x = {
				name = "Sessions",
			},
			l = {
				name = "Pencil",
			},
		}, { prefix = "<space>" })
	end,
}
