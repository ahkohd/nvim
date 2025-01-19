return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	keys = {
		{
			"<leader>t",
			"<cmd>Copilot toggle<cr>",
			desc = "Toggle Copilot",
		},
	},
	opts = {
		panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<c-y>",
				next = "<c-j>",
				prev = "<c-k>",
				accept_word = false,
				accept_line = false,
				dismiss = "<c-a>",
			},
		},
	},
}
