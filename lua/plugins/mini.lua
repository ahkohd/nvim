return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()

		require("mini.surround").setup({
			mappings = {
				add = "<leader>;a",
				delete = "<leader>;d",
				find = "<leader>;f",
				find_left = "<leader>;F",
				highlight = "<leader>;h",
				replace = "<leader>;r",
				update_n_lines = "<leader>;n",
				suffix_last = "l",
				suffix_next = "n",
			},
		})

		require("mini.bracketed").setup()

		require("mini.pairs").setup()

    require("mini.move").setup()
	end,
}
