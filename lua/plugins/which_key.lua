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
			["<space>"] = {
				w = { "<cmd>w<cr>", "Save" },
				Q = { "<cmd>qa!<cr>", "Quit" },
				v = { "<cmd>Themery<cr>", "Quit" },
			},
			["<space>s"] = {
				name = "Find and Replace",
			},
			["<space>d"] = {
				name = "Diagnostics",
			},
			["<space>g"] = {
				name = "Git mode",
			},
			["<space>b"] = {
				name = "Debug",
			},
			["<space>t"] = {
				name = "Tests",
			},
			["<space>x"] = {
				name = "Sessions",
			},
			["<space>l"] = {
				name = "Pencil",
			},
		})
	end,
}
