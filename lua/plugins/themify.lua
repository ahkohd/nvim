return {
	"LmanTW/themify.nvim",
	event = "VeryLazy",
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
		require("themify").setup({
			"folke/tokyonight.nvim",
			"catppuccin/nvim",
			"monochrome",
			"projekt0n/github-nvim-theme",
			"everviolet/nvim",
			"kyazdani42/blue-moon",
      "Mofiqul/vscode.nvim",
      "marko-cerovac/material.nvim"
		})
	end,
}
