-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
	branch = "main",
	cmd = "Yazi",
	keys = {
		{
			"<leader>o",
			"<cmd>Yazi<cr>",
			desc = "Yazi",
		},
		{
			"<leader>O",
			"<cmd>Yazi cwd<cr>",
			desc = "Yazi (Root)",
		},
	},
	opts = {
		highlight_hovered_buffers_in_same_directory = false,
	},
}
