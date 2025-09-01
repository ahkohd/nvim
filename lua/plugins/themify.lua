return {
	"LmanTW/themify.nvim",
	lazy = false,
	priority = 999,
	keys = {
		{
			"<leader>T",
			"<cmd>Themify<CR>",
			desc = "Themes",
		},
	},
	config = function()
		require("themify").setup({
			"nyoom-engineering/oxocarbon.nvim",
			"monochrome",
			"folke/tokyonight.nvim",
		})
	end,
}
