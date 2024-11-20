-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
	branch = "main",
	event = "VeryLazy",
	keys = {
		{
			"<space>e",
			"<cmd>Yazi<cr>",
			desc = "Toggle Yazi (root)",
		},
		{
			"<space>o",
			"<cmd>Yazi cwd<cr>",
			desc = "Toggle Yazi (cwd)",
		},
		{
			"<space>O",
			"<cmd>Yazi toggle<cr>",
			desc = "Toggle Yazi (resume)",
		},
	},
	opts = {
		open_for_directories = true,
		yazi_floating_window_border = "rounded",
	},
}
