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

			{ "<space>q", group = "Close" },

			{ "<space>c", group = "Document Info" },

			{ "<space>s", group = "Find and Replace" },

			{ "<space>d", group = "Diagnostics" },

			{ "<space>b", group = "Debug" },

			{ "<space>l", group = "Pencil" },

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

			{
				"<space>'",

				"<cmd>TogglePencil<cr>",

				desc = "Toggle text wrap",
			},

			{
				"<space>i",
				group = "Rust",
			},

			{
				"<space>if",
				function()
					vim.cmd.RustLsp("flyCheck")
				end,
				desc = "Run fly check",
			},

			{
				"<space>iF",
				function()
					vim.cmd.RustLsp("flyCheck", "clear")
				end,
				desc = "Clear fly check",
			},

			{
				"<space>ix",
				function()
					vim.cmd.RustLsp("flyCheck", "cancel")
				end,
				desc = "Cancel fly check",
			},

			{
				"<space>im",
				function()
					vim.cmd.RustLsp("expandMacro")
				end,
				desc = "Expand macro",
			},

			{
				"<space>ir",
				function()
					vim.cmd.RustLsp("rebuildProcMacros")
				end,
				desc = "Rebuild proc macros",
			},

			{
				"<space>ij",
				function()
					vim.cmd.RustLsp("moveItem", "down")
				end,
				desc = "Move item down",
			},

			{
				"<space>ik",
				function()
					vim.cmd.RustLsp("moveItem", "up")
				end,
				desc = "Move item up",
			},

			{
				"<space>ia",
				function()
					vim.cmd.RustLsp("hover", "range")
				end,
				desc = "Hover range",
			},

			{
				"<space>ie",
				function()
					vim.cmd.RustLsp("explainError", "current")
				end,
				desc = "Explain error",
			},

			{
				"<space>io",
				function()
					vim.cmd.RustLsp("openCargo")
				end,
				desc = "Open Cargo.toml",
			},

			{
				"<space>ip",
				function()
					vim.cmd.RustLsp("parentModule")
				end,
				desc = "Jump to Parent Module",
			},

			{
				"<space>id",
				function()
					vim.cmd.RustLsp("openDocs")
				end,
				desc = "Open docs for symbol under cursor",
			},
		})
	end,
}
