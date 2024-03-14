return {
	"smoka7/hop.nvim",
	version = "*",
	event = "BufRead",
	keys = {
		{
			"f",
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
			desc = "Jump to character after cursor",
		},
		{
			"F",
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
			desc = "Jump to character before cursor",
		},
		{
			"t",
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
			desc = "Jump to the character before the target character after cursor",
		},
		{
			"T",
			"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
			desc = "Jump to the character after the target character before cursor",
		},
		{
			"<space>fj",
			"<cmd>lua require'hop'.hint_words()<cr>",
			desc = "Jump to word",
			mode = { "n", "x", "o" },
		},
	},
	opts = {
		multi_windows = true,
		keys = "etovxqpdygfblzhckisuran",
	},
}
