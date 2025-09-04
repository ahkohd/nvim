-- luacheck: globals vim

return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd("UndotreeToggle")
				vim.cmd("UndotreeFocus")
			end,
			desc = "Undo tree",
		},
	},
	config = function() end,
}
