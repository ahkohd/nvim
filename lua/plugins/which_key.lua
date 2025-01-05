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
			{ "<leader>qj", "<cmd>clearjumps<cr>", desc = "Clear Jumplist" },

			{
				"<leader>qb",
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

			{ "<leader>q", group = "Close" },

			{ "<leader>b", group = "Find & Replace" },

			{ "<leader>s", group = "Surround" },

			{ "<leader>I", group = "Neogen" },

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

			{
				"<leader>i",
				group = "Rust",
			},

			{
				"<leader>if",
				function()
					vim.cmd.RustLsp("flyCheck")
				end,
				desc = "Run fly check",
			},

			{
				"<leader>iF",
				function()
					vim.cmd.RustLsp("flyCheck", "clear")
				end,
				desc = "Clear fly check",
			},

			{
				"<leader>ix",
				function()
					vim.cmd.RustLsp("flyCheck", "cancel")
				end,
				desc = "Cancel fly check",
			},

			{
				"<leader>im",
				function()
					vim.cmd.RustLsp("expandMacro")
				end,
				desc = "Expand macro",
			},

			{
				"<leader>ir",
				function()
					vim.cmd.RustLsp("rebuildProcMacros")
				end,
				desc = "Rebuild proc macros",
			},

			{
				"<leader>ij",
				function()
					vim.cmd.RustLsp("moveItem", "down")
				end,
				desc = "Move item down",
			},

			{
				"<leader>ik",
				function()
					vim.cmd.RustLsp("moveItem", "up")
				end,
				desc = "Move item up",
			},

			{
				"<leader>ia",
				function()
					vim.cmd.RustLsp("hover", "range")
				end,
				desc = "Hover range",
			},

			{
				"<leader>ie",
				function()
					vim.cmd.RustLsp("explainError", "current")
				end,
				desc = "Explain error",
			},

			{
				"<leader>io",
				function()
					vim.cmd.RustLsp("openCargo")
				end,
				desc = "Open Cargo.toml",
			},

			{
				"<leader>ip",
				function()
					vim.cmd.RustLsp("parentModule")
				end,
				desc = "Jump to Parent Module",
			},

			{
				"<leader>id",
				function()
					vim.cmd.RustLsp("openDocs")
				end,
				desc = "Open docs for symbol under cursor",
			},
		})
	end,
}
