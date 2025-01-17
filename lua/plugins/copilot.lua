return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	keys = {
		{
			"<leader>t",
			"<cmd>Copilot<cr>",
			desc = "Toggle on Copilot",
		},
		{
			"<leader>T",
			"<cmd>Copilot disable<cr>",
			desc = "Toggle off Copilot",
		},
	},
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<c-y>",
				next = "<c-d>",
				prev = "<c-u>",
				accept_word = false,
				accept_line = false,
				dismiss = "<c-a>",
			},
		},
	},
}
