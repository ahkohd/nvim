return {
	"dnlhc/glance.nvim",
	event = "VeryLazy",
	keys = {
		{ "gd", "<cmd>Glance definitions<CR>", desc = "Peek definitions" },
		{ "gr", "<cmd>Glance references<CR>", desc = "Peek references" },
		{ "gt", "<cmd>Glance type_definitions<CR>", desc = "Peek type definitions" },
		{ "gm", "<cmd>Glance implementations<CR>", desc = "Peek implementations" },
	},

	config = function()
		local glance = require("glance")
		local actions = glance.actions

		require("glance").setup({
			preview_win_opts = {
				cursorline = false,
				number = false,
			},
			mappings = {
				list = {
					["H"] = actions.enter_win("preview"),
				},
				preview = {
					["L"] = actions.enter_win("list"),
				},
			},
		})
	end,
}
