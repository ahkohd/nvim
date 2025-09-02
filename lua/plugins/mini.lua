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

		require("mini.move").setup({
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = '<M-S-h>',
				right = '<M-S-l>',
				down = '<M-S-j>',
				up = '<M-S-k>',

				-- Move current line in Normal mode
				line_left = '<M-S-h>',
				line_right = '<M-S-l>',
				line_down = '<M-S-j>',
				line_up = '<M-S-k>',
			},

			-- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
	end,
}
