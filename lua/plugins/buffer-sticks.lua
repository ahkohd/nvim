return {
	dir = "~/Developer/buffer-sticks.nvim",
	event = "VeryLazy",
	config = function()
		local sticks = require("buffer-sticks")
		sticks.setup()
		sticks.show()
	end,
}
