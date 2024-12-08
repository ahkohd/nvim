-- luacheck: globals vim
return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.5, height = 0.5 },
					zindex = 200,
				},
			},
		},
	},
	keys = {
		{
			"<leader>t",
			"<cmd>Trouble preview_float toggle focus=true filter.buf=0<cr>",
			desc = "Toggle Trouble (Buffer)",
		},
		{
			"<leader>T",
			"<cmd>Trouble preview_float toggle focus=true<cr>",
			desc = "Toggle Trouble (Workspace)",
		},
	},
}
