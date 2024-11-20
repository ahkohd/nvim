-- luacheck: globals vim

return {
	"mikavilpas/yazi.nvim",
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
			function()
				require("yazi").toggle()
			end,
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		open_for_directories = true,
		yazi_floating_window_border = "rounded",
	},
}
