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

		wk.add({
			{ "<space>m", group = "Marks" },

			{ "<space>qj", "<cmd>clearjumps<cr>", desc = "Clear Jumplist" },

			{
				"<space>qb",
				function()
					local bufs = vim.api.nvim_list_bufs()

					local current_buf = vim.api.nvim_get_current_buf()

					for _, i in ipairs(bufs) do
						if i ~= current_buf then
							vim.api.nvim_buf_delete(i, {})
						end
					end
				end,
				desc = "Close other Buffers",
			},

			{
				"<space>v",
				"<cmd>Themery<cr>",
				desc = "Theme",
			},

			{ "<space>s", group = "Find and Replace" },

			{ "<space>d", group = "Diagnostics" },

			{ "<space>b", group = "Debug" },

			{ "<space>t", group = "Tests" },

			{ "<space>l", group = "Pencil" },

			{ "<space>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },

			{
				"<space>.",

				function()
					vim.o.number = not vim.o.number

					vim.o.relativenumber = not vim.o.relativenumber
				end,

				desc = "Toggle line number",
			},

			{
				"<space>,",

				function()
					vim.o.mouse = vim.o.mouse == "a" and "" or "a"
				end,

				desc = "Toggle Mouse support",
			},

			{
				"<space><tab>",

				function()
					vim.cmd([[tab split]])
				end,

				desc = "Make buffer full-screen",
			},
		})
	end,
}
