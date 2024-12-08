-- luacheck: globals vim

return {
	"preservim/vim-pencil",
	cmd = { "PencilToggle", "PencilSoft", "PencilHard" },
	keys = {
		{
			"<leader>'",
			function()
				vim.cmd("PencilToggle")
			end,
			desc = "Toggle text wrap",
		},
	},
	config = function() end,
}
