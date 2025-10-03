-- luacheck: globals BufferSticks

return {
	"ahkohd/buffer-sticks.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>J",
			function()
				BufferSticks.toggle()
			end,
			desc = "Toggle BufferSticks",
		},
		{
			"<leader>j",
			function()
				BufferSticks.jump()
			end,
			desc = "Jump to buffer",
		},
	},
	config = function()
		local sticks = require("buffer-sticks")
		sticks.setup({
			filter = { buftypes = { "terminal" } },
			highlights = {
				active = { link = "Statement" },
				alternate = { link = "StorageClass" },
				inactive = { link = "Whitespace" },
				active_modified = { link = "Constant" },
				alternate_modified = { link = "Constant" },
				inactive_modified = { link = "Constant" },
				label = { link = "Comment" },
				filter_selected = { link = "Statement" },
				filter_title = { link = "Comment" },
			},
		})
		sticks.show()
	end,
}
