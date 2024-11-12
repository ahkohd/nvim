return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<space>qs",
			function()
				require("persistence").load()
			end,
			desc = "Resume session",
		},
		{
			"<space>qS",
			function()
				require("persistence").select()
			end,
			desc = "Pick session",
		},
		{
			"<space>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Resume Last session",
		},
		{
			"<space>qd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop Session",
		},
	},
}
