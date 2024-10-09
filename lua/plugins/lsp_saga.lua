-- luacheck: globals vim

return {
	"nvimdev/lspsaga.nvim",
	event = "BufRead",
	keys = {
		{ "<space>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
		{ "<space>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics" },
		{ "<space>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Show workspace diagnostics" },
		{ "<space>dk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to Previous diagnostic" },
		{ "<space>dj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to Next diagnostic" },

		{
			"K",
			function()
				local utils = require("core.utils.buffer")

				if utils.filetype() == "rust" then
					vim.cmd.RustLsp("hover", "actions")
					vim.cmd.RustLsp("hover", "actions")
				else
					vim.cmd("Lspsaga hover_doc")
				end
			end,
			desc = "Show hover doc",
		},

		{ "gR", "<cmd>Lspsaga rename<CR>", desc = "Rename all references" },
		{ "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Go-to definition" },
		{ "gT", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go-to type definition" },
		{ "<space>x", "<cmd>Lspsaga outline<CR>", desc = "Show outline" },
	},
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			ui = {
				code_action = "",
			},
			symbol_in_winbar = {
				enable = false,
				separator = " → ",
			},
			lightbulb = {
				enable = false,
			},
		})

		local function lspSymbol(name, icon)
			local hl = "DiagnosticSign" .. name
			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		lspSymbol("Error", "")
		lspSymbol("Hint", "")
		lspSymbol("Info", "")
		lspSymbol("Warn", "")
	end,
}
