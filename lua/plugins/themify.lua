return {
	"LmanTW/themify.nvim",
	dependencies = {
		"kyza0d/xeno.nvim"
	},
	lazy = false,
	priority = 999,
	keys = {
		{
			"<leader>t",
			"<cmd>Themify<CR>",
			desc = "Theme",
		},

		{
			"<leader>T",
			function()
				require("core.utils.buffer").redir_to_buffer_with_colors("highlight", "Highlight Groups")
			end,
			desc = "Highlight Groups",
		},
	},
	config = function()
		local xeno = require("xeno")
		xeno.new_theme("xeno-lilypad", {
			base = "#1E1E1E",
			accent = "#8CBE8C",
			contrast = 0.1,
		})
		xeno.new_theme("xeno-pink-haze", {
			base = "#0f0c0e",
			accent = "#D19EBC",
			contrast = 0.1,
		})
		xeno.new_theme("xeno-golden-hour", {
			base = "#11100f",
			accent = "#FFCC33",
			contrast = 0.1,
		})

		require("themify").setup({
			"nyoom-engineering/oxocarbon.nvim",
			"folke/tokyonight.nvim",
			"catppuccin/nvim",
			"monochrome",
			"xeno-lilypad",
			"xeno-pink-haze",
			"xeno-golden-hour",
			"projekt0n/github-nvim-theme",
			"everviolet/nvim",
      "vague-theme/vague.nvim",
      "kyazdani42/blue-moon"
		})
	end,
}
