--luacheck: globals vim BufferSticks

return {
	"ahkohd/buffer-sticks.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>j",
			function()
				BufferSticks.jump()
			end,
			desc = "Buffer jump mode",
		},
	},
	config = function()
		local stick = require("buffer-sticks")
		stick.setup({
			filter = { buftypes = { "terminal" } },
			highlights = {
				active = { link = "Statement" },
				inactive = { link = "Whitespace" },
				active_modified = { link = "Statement" },
				inactive_modified = { link = "Whitespace" },
				label = { link = "Comment" },
			},
		})
		stick.show()
	end,
}
