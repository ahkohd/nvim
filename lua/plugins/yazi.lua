-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"<space>o",
			function()
				require("yazi").yazi()
			end,
			desc = "Toggle Yazi (cwd)",
		},
		{
			"<space>e",
			function()
				require("yazi").yazi(nil, vim.fn.getcwd())
			end,
			desc = "Toggle Yazi (root)",
		},
		{
			"<space>E",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		open_for_directories = true,
		yazi_floating_window_border = "rounded",
	},
}
