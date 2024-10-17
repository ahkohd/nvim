-- luacheck: globals vim

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		autojump = true,
		backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
		filter_kind = {
			"Type",
			"Constant",
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
		},
	},
	keys = {
		{
			"<space>cs",
			function()
				vim.cmd("AerialToggle! left")
			end,
			desc = "Toggle Buffer Symbols",
		},
		{
			"<space>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}
