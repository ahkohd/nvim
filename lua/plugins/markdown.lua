-- luacheck: globals vim

return {
	"henriklovhaug/Preview.nvim",
	cmd = { "Preview" },
	config = function()
		require("preview").setup()
	end,
}
