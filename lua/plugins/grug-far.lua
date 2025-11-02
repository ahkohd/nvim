return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar", "GrugFarWithin" },
	keys = {
		{ "<leader>R", "<cmd>lua require('grug-far').open()<CR>", desc = "Find & Replace" },
	},
	opts = {
    windowCreationCommand = 'split',
    disableBufferLineNumbers = true
  },
}
