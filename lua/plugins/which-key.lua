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
				separator = "",
				keys = {
					Up = "↑",
					Down = "↓",
					Left = "←",
					Right = "→",
					C = "C-",
					M = "M-",
					D = "D-",
					S = "S-",
					CR = "⏎",
					Esc = "Esc",
					ScrollWheelDown = "↓",
					ScrollWheelUp = "↑",
					NL = "⏎",
					BS = "⌫",
					Space = "␣",
					Tab = "⇥",
					F1 = "F1",
					F2 = "F2",
					F3 = "F3",
					F4 = "F4",
					F5 = "F5",
					F6 = "F6",
					F7 = "F7",
					F8 = "F8",
					F9 = "F9",
					F10 = "F10",
					F11 = "F11",
					F12 = "F12",
				},
			},
		})

		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>s", group = "Surround" },
			{ "<leader>q", group = "Quickfix" },
			{ "<leader>th", group = "Highlights" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "Language & Locations" },
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
