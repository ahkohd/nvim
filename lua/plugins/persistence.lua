return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>bs",
			function()
				require("persistence").load()
			end,
			desc = "Load session",
		},
		{
			"<leader>bS",
			function()
				require("persistence").select()
			end,
			desc = "Select session",
		},
		{
			"<leader>bl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load last session",
		},
		{
			"<leader>bd",
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
