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
			desc = "Jump to buffer",
		},
	},
	config = function()
		local stick = require("buffer-sticks")
		stick.setup({
			filter = { buftypes = { "terminal" } },
			highlights = {
				active = { link = "Statement" },
				alternate = { link = "StorageClass" },
				inactive = { link = "Whitespace" },
				active_modified = { link = "Constant" },
				alternate_modified = { link = "Constant" },
				inactive_modified = { link = "Constant" },
				label = { link = "Comment" },
			},
		})
		stick.show()
	end,
}
