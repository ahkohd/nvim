-- luacheck: globals vim

return {
	dir = "~/.config/nvim/lua/dev/git-blame",
	event = "BufRead",
	config = function()
		require("git-blame").setup()
	end,
}
