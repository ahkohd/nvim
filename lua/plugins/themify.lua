return {
	"LmanTW/themify.nvim",
	lazy = false,
	priority = 1000,
	keys = {
		{
			"<leader>b",
			"<cmd>Themify<CR>",
			desc = "Themes",
		},
	},
	config = function()
		require("themify").setup({
			"nyoom-engineering/oxocarbon.nvim",
			"monochrome",
			"xeno-lilypad",
			"xeno-pink-haze",
			"xeno-golden-hour",
		})
	end,
}
