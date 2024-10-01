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

			{ "<space>t", group = "Tests" },

			{
				"<space>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run the nearest test",
			},
			{
				"<space>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run all tests current file",
			},
			{
				"<space>tT",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug the nearest test",
			},
			{
				"<space>ts",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop the nearest test",
			},
			{
				"<space>ta",
				function()
					require("neotest").run.attach()
				end,
				desc = "Attach to the nearest test",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run the last test",
			},
			{
				"<leader>tL",
				function()
					require("neotest").run.run_last({ strategy = "dap" })
				end,
				desc = "Debug the last test",
			},
			{
				"<leader>tw",
				function()
					require("neotest").run.run({
						jestCommand = "jest --watch",
					})
				end,
				desc = "Run Watch (jest)",
			},
		})
	end,
}
