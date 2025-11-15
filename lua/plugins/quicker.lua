return {
	"stevearc/quicker.nvim",
	ft = "qf",
	keys = {
		{
			"<leader>qo",
			function()
				require("quicker").toggle()
			end,
			desc = "Quickfix",
		},
		{
			"<leader>ql",
			function()
				require("quicker").toggle({ loclist = true })
			end,
			desc = "Loclist",
		},
	},
	opts = {
		keys = {
			{
				">",
				function()
					require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
				end,
				desc = "Expand quickfix context",
			},
			{
				"<",
				function()
					require("quicker").collapse()
				end,
				desc = "Collapse quickfix context",
			},
		},
		borders = {
			vert = "│",
			-- Strong headers separate results from different files
			strong_header = "─",
			strong_cross = "┼",
			strong_end = "┤",
			-- Soft headers separate results within the same file
			soft_header = "─",
			soft_cross = "┼",
			soft_end = "┤",
		},
	},
}
