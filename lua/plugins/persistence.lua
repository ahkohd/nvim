return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>ss",
			function()
				require("persistence").load()
			end,
			desc = "Load session",
		},
		{
			"<leader>sS",
			function()
				require("persistence").select()
			end,
			desc = "Select session",
		},
		{
			"<leader>sl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load last session",
		},
		{
			"<leader>sd",
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
