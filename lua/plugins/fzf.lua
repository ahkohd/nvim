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
			"<space>f",
			"<cmd>FzfLua files<cr>",
			desc = "Find files",
		},
		{
			"<space>F",
			"<cmd>FzfLua live_grep_native<cr>",
			desc = "Search (live grep)",
		},
		{
			"<space>j",
			"<cmd>FzfLua jumps<cr>",
			desc = "Search jumplist",
		},
		{
			"<space>J",
			"<cmd>FzfLua marks<cr>",
			desc = "Search marks",
		},
		{
			"<space><space>",
			"<cmd>FzfLua buffers<cr>",
			desc = "Search buffers",
		},
		{
			"<space>\\",
			"<cmd>FzfLua helptags<cr>",
			desc = "Search helptags",
		},
		{
			"<space>d",
			"<cmd>FzfLua lsp_document_diagnostics<cr>",
			desc = "Search document diagnostics",
		},
		{
			"<space>D",
			"<cmd>FzfLua lsp_workspace_diagnostics<cr>",
			desc = "Search workspace diagnostics",
		},
		{
			"<space>a",
			"<cmd>FzfLua lsp_document_symbols<cr>",
			desc = "Search document symbols",
		},
		{
			"<space>A",
			"<cmd>FzfLua lsp_workspace_symbols<cr>",
			desc = "Search workspace symbols",
		},
		{
			"<space>k",
			"<cmd>FzfLua lsp_code_actions<cr>",
			desc = "Show code actions",
		},
		{
			"<space>p",
			function()
				require("neoclip.fzf")()
			end,
			desc = "Search yank list",
		},
	},
	opts = {},
}
