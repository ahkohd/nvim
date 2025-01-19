return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Load session",
		},
		{
			"<leader>qS",
			function()
				require("persistence").select()
			end,
			desc = "Select session",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load last session",
		},
		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop persistence",
		},
	},
	opts = {
		need = 0,
	},
}
