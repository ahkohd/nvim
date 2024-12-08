return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"AckslD/nvim-neoclip.lua",
			name = "neoclip",
			opts = {},
		},
	},
	cmd = "FzfLua",
	keys = {
		{
			"<leader>f",
			"<cmd>FzfLua files<cr>",
			desc = "Find files",
		},
		{
			"<leader>F",
			"<cmd>FzfLua live_grep_native<cr>",
			desc = "Search (live grep)",
		},
		{
			"<leader>j",
			"<cmd>FzfLua jumps<cr>",
			desc = "Search jumplist",
		},
		{
			"<leader>J",
			"<cmd>FzfLua marks<cr>",
			desc = "Search marks",
		},
		{
			"<leader><leader>",
			"<cmd>FzfLua buffers<cr>",
			desc = "Search buffers",
		},
		{
			"<leader>\\",
			"<cmd>FzfLua helptags<cr>",
			desc = "Search helptags",
		},
		{
			"<leader>d",
			"<cmd>FzfLua lsp_document_diagnostics<cr>",
			desc = "Search document diagnostics",
		},
		{
			"<leader>D",
			"<cmd>FzfLua lsp_workspace_diagnostics<cr>",
			desc = "Search workspace diagnostics",
		},
		{
			"<leader>a",
			"<cmd>FzfLua lsp_document_symbols<cr>",
			desc = "Search document symbols",
		},
		{
			"<leader>A",
			"<cmd>FzfLua lsp_workspace_symbols<cr>",
			desc = "Search workspace symbols",
		},
		{
			"<leader>k",
			"<cmd>FzfLua lsp_code_actions<cr>",
			desc = "Show code actions",
		},
		{
			"<leader>p",
			function()
				require("neoclip.fzf")()
			end,
			desc = "Search yank list",
		},
	},
	opts = {},
}
