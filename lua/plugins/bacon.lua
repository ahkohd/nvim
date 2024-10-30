return {
	"Canop/nvim-bacon",
	event = "VeryLazy",
	opts = {
		quickfix = {
			enabled = true,
			event_trigger = true,
		},
	},
	keys = {
		{
			"<space>cb",
			"<cmd>BaconList<cr>",
			desc = "Bacon (list)",
		},
	},
}
