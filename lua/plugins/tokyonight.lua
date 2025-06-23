-- luacheck: globals vim

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local theme = require("tokyonight")
		theme.setup({})

		vim.cmd("colorscheme tokyonight-night")
	end,
}
