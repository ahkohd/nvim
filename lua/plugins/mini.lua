return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()

		require("mini.surround").setup({
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd",
				find = "<leader>sf",
				find_left = "<leader>sF",
				highlight = "<leader>sh",
				replace = "<leader>sr",
				update_n_lines = "<leader>sn",
				suffix_last = "l",
				suffix_next = "n",
			},
		})

		require("mini.bracketed").setup()

		require("mini.pairs").setup()

		require("mini.move").setup({
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Move visual selection in Visual mode.
				left = "<c-s-h>",
				right = "<c-s-l>",
				down = "<c-s-j>",
				up = "<c-s-k>",
			},

			-- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
	end,
}
