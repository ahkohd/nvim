-- luacheck: globals vim

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
			delay = 300,
			icons = {
				mappings = false,
			},
		})

		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>w", group = "Session" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>;", group = "Surround" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "Locations & Replace" },
			{ "<M-S-O>", ":bprev<CR>", desc = "Previous buffer" },
			{ "<M-S-I>", ":bnext<CR>", desc = "Next buffer" },
			{
				"<leader>.",
				function()
					vim.o.number = not vim.o.number

					vim.o.relativenumber = not vim.o.relativenumber
				end,
				desc = "Toggle line number",
			},
			{
				"<leader>,",
				function()
					vim.o.mouse = vim.o.mouse == "a" and "" or "a"
				end,
				desc = "Toggle mouse",
			},
			{
				"<leader><tab>",
				function()
					vim.cmd([[tab split]])
				end,
				desc = "Buffer full-screen",
			},
		})
	end,
}
