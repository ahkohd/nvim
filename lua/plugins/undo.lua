-- luacheck: globals vim

return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{
			"<space>u",
			function()
				vim.cmd("UndotreeToggle")
				vim.cmd("UndotreeFocus")
			end,
			desc = "Toggle Undo tree",
		},
	},
	config = function() end,
}
