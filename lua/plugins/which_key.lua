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
			{ "<leader>q", group = "Quickfix" },

			{ "<leader>c", group = "Clear Lists & Buffers" },

			{ "<leader>b", group = "Sessions" },

			{ "<leader>;", group = "Surround" },

			{ "<leader>g", group = "Git" },

			{ "<leader>l", group = "Find and Replace" },

			{
				"<leader>r",
				group = "Rust",
			},

			{ "<leader>cj", "<cmd>clearjumps<cr>", desc = "Clear Jumplist" },

			{
				"<leader>cb",
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
