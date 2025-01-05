return {
	"danymat/neogen",
	cmd = "Neogen",
	keys = {
		{
			"<leader>If",
			function()
				require("neogen").generate({
					type = "func",
				})
			end,
			desc = "Gen. Function",
		},
		{
			"<leader>IF",
			function()
				require("neogen").generate({
					type = "file",
				})
			end,
			desc = "Gen. File",
		},
		{
			"<leader>Ic",
			function()
				require("neogen").generate({
					type = "class",
				})
			end,
			desc = "Gen. Class",
		},
		{
			"<leader>It",
			function()
				require("neogen").generate({
					type = "type",
				})
			end,
			desc = "Gen. Type",
		},
	},
	opts = {},
}
