-- luacheck: globals vim

return {
	"preservim/vim-pencil",
	cmd = { "PencilToggle", "PencilSoft", "PencilHard" },
	keys = {
		{
			"<space>lw",
			function()
				vim.cmd("PencilToggle")
			end,
			desc = "Toggle line wrap",
		},
		{
			"<space>ls",
			function()
				vim.cmd("PencilSoft")
			end,
			desc = "Enable soft line wrap",
		},
		{
			"<space>lh",
			function()
				vim.cmd("PencilHard")
			end,
			desc = "Enable hard line breaks",
		},
	},
	config = function() end,
}
