return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		{ "<leader>bs", "<cmd>lua require('grug-far').open()<CR>", desc = "Find & Replace" },
		{
			"<leader>bw",
			"<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
			desc = "Find & replace word under cursor",
		},
		{
			"<leader>bv",
			"<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Find & replace visual selection",
			mode = "x",
		},
		{
			"<leader>bf",
			"<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Find & replace current file",
		},
	},
	opts = {},
}
