return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	opts = {},
	keys = {
		{
			"<leader>f",
			function()
				require("fff").find_files()
			end,
			desc = "Finder",
		},
	},
}
