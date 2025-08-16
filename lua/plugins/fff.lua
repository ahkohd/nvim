return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	opts = {
    prompt = "➜ ",
  },
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
