return {
	"Canop/nvim-bacon",
	cmd = "BaconLoad",
	opts = {
		quickfix = {
			enabled = true,
			event_trigger = true,
		},
	},
	keys = {
		{
			"<leader>ib",
			"<cmd>BaconList<cr>",
			desc = "Bacon list locations",
		},
	},
}
