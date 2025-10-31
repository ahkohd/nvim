return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar", "GrugFarWithin" },
	keys = {
		{ "<leader>g", "<cmd>lua require('grug-far').open()<CR>", desc = "Find & Replace" },
		{
			"<leader>G",
			"<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Find & replace visual selection",
			mode = "x",
		},
	},
	opts = {
    windowCreationCommand = 'split',
    disableBufferLineNumbers = true
  },
}
