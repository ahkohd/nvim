-- luacheck: globals vim

return {
	"mbbill/undotree",
	event = "VeryLazy",
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
