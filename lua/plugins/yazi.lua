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
			desc = "Open the file manager",
		},
		{
			"<space>-",
			function()
				require("yazi").yazi(nil, vim.fn.getcwd())
			end,
			desc = "Open the file manager in nvim's working directory",
		},
	},
	opts = {
		open_for_directories = false,
		yazi_floating_window_border = "rounded",
	},
}
