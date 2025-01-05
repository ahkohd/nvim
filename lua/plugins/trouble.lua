-- luacheck: globals vim
return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		follow = true,
		auto_preview = false,
		restore = true,
		focus = true,
		win = {
			type = "float",
		},
		keys = {
			o = "jump_close",
			["<enter>"] = "",
			q = "close",
			["<esc>"] = "close",
		},
	},
	keys = {
		{
			"<leader>d",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Toggle Trouble (Buffer)",
		},
		{
			"<leader>D",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle Trouble (Workspace)",
		},
	},
}
