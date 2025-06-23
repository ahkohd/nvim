-- luacheck: globals vim

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
			delay = 300,
		})

		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>b", group = "Sessions" },
			{ "<leader>;", group = "Surround" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "Locations & Replace" },
			{ "<C-S-O>", ":bprev<CR>", desc = "Previous buffer" },
			{ "<C-S-I>", ":bnext<CR>", desc = "Next buffer" },
			{ "<C-i>", "<C-i>zz", desc = "Jump forward (centered)" },
			{ "<C-o>", "<C-o>zz", desc = "Jump back (centered)" },
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
				desc = "Toggle mouse support",
			},
			{
				"<leader><tab>",
				function()
					vim.cmd([[tab split]])
				end,
				desc = "Make buffer full-screen",
			},
		})
	end,
}
