-- luacheck: globals vim

return {
	"preservim/vim-pencil",
	cmd = { "PencilToggle", "PencilSoft", "PencilHard" },
	keys = {
		{
			"<leader>lw",
			function()
				vim.cmd("PencilToggle")
			end,
			desc = "Toggle line wrap",
		},
		{
			"<leader>ls",
			function()
				vim.cmd("PencilSoft")
			end,
			desc = "Enable soft line wrap",
		},
		{
			"<leader>lh",
			function()
				vim.cmd("PencilHard")
			end,
			desc = "Enable hard line breaks",
		},
	},
	config = function() end,
}
