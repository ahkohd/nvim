-- luacheck: globals vim

return {
	"folke/trouble.nvim",
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
	cmd = "Trouble",
	keys = {
		{
			"<space>cx",
			"<cmd>Trouble preview_float toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<space>cl",
			"<cmd>Trouble preview_float toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<space>cs",
			"<cmd>Trouble symbols focus=true win.type=float<cr>",
			desc = "Toggle Buffer Symbols",
		},
	},
}
