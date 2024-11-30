-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
	branch = "main",
	cmd = "Yazi",
	keys = {
		{
			"<space>o",
			"<cmd>Yazi<cr>",
			desc = "Toggle Yazi",
		},
		{
			"<space>O",
			"<cmd>Yazi toggle<cr>",
			desc = "Toggle Yazi (resume)",
		},
		{
			"<space>w",
			"<cmd>Yazi cwd<cr>",
			desc = "Toggle Yazi (cwd)",
		},
	},
	opts = {
		highlight_hovered_buffers_in_same_directory = false,
	},
}
