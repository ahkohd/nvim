return {
	"github/copilot.vim",
	cmd = "Copilot",
	keys = {
		{
			"<leader>t",
			"<cmd>Copilot<cr>",
			desc = "Toggle on Copilot",
		},
		{
			"<leader>T",
			"<cmd>Copilot disable<cr>",
			desc = "Toggle off Copilot",
		},
	},
	config = function() end,
}
