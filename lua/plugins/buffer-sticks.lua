-- luacheck: globals BufferSticks

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
		local sticks = require("buffer-sticks")

		sticks.setup({
			filter = { buftypes = { "terminal" } },
			preview = {
				enabled = true,
				mode = "float",
				float = {
					position = "right",
					width = 0.5,
					height = 0.8,
					border = "rounded",
				},
			},
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
				list_selected = { link = "Statement" },
			},
		})
		sticks.show()
	end,
}
