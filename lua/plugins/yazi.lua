-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
	branch = "main",
	event = "VeryLazy",
	keys = {
		{
			"<space>oo",
			"<cmd>Yazi<cr>",
			desc = "Toggle Yazi",
		},
		{
			"<space>oe",
			"<cmd>Yazi cwd<cr>",
			desc = "Toggle Yazi (root)",
		},
		{
			"<space>e",
			"<cmd>Yazi toggle<cr>",
			desc = "Toggle Yazi (resume)",
		},
	},
	opts = {
		open_for_directories = true,
		highlight_hovered_buffers_in_same_directory = false,
	},
}
