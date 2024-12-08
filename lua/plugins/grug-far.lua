return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		{ "<leader>ls", "<cmd>lua require('grug-far').open()<CR>", desc = "Find & Replace" },
		{
			"<leader>lw",
			"<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
			desc = "Find & replace word under cursor",
		},
		{
			"<leader>lv",
			"<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Find & replace visual selection",
			mode = "x",
		},
		{
			"<leader>lf",
			"<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
			desc = "Find & replace current file",
		},
	},
	opts = {},
}
