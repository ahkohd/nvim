-- luacheck: globals vim

return {
	"dnlhc/glance.nvim",
	cmd = "Glance",
	keys = {
		{ "gd", "<cmd>Glance definitions<CR>", desc = "Peek definitions" },
		{
			"gD",
			function()
				vim.lsp.buf.definition()
			end,
			desc = "Jump to definition",
		},
		{ "gr", "<cmd>Glance references<CR>", desc = "Peek references" },
		{
			"gR",
			function()
				vim.lsp.buf.rename()
			end,
			desc = "Rename symbol",
		},
		{ "gt", "<cmd>Glance type_definitions<CR>", desc = "Peek type definitions" },
		{
			"gT",
			function()
				vim.lsp.buf.type_definition()
			end,
			desc = "Jump to type definition",
		},
		{ "gm", "<cmd>Glance implementations<CR>", desc = "Peek implementations" },
		{
			"gM",
			function()
				vim.lsp.buf.implementation()
			end,
			desc = "Jump to type implementation",
		},
		{
			"K",
			function()
				local utils = require("core.utils.buffer")

				if utils.filetype() == "rust" then
					vim.cmd.RustLsp("hover", "actions")
					vim.cmd.RustLsp("hover", "actions")
				else
					vim.lsp.buf.hover()
				end
			end,
			desc = "Show hover doc",
		},
		{
			"gs",
			function()
				vim.lsp.buf.signature_help()
			end,
			desc = "Show signature help",
		},
	},

	config = function()
		local glance = require("glance")

		local actions = glance.actions

		require("glance").setup({
			preview_win_opts = {
				cursorline = false,
				number = false,
			},
			mappings = {
				list = {
					["H"] = actions.enter_win("preview"),
				},
				preview = {
					["L"] = actions.enter_win("list"),
				},
			},
		})
	end,
}
