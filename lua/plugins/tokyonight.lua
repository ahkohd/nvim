-- luacheck: globals vim

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local theme = require("tokyonight")

		theme.setup({
			transparent = true,
		})

		vim.cmd("colorscheme tokyonight-storm")
	end,
}
