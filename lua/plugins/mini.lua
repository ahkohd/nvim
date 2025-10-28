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
				left = '<S-Left>',
				right = '<S-Right>',
				down = '<S-Down>',
				up = '<S-Up>',

				-- Move current line in Normal mode
				-- line_left = '<A-Left>',
				-- line_right = '<A-Right>',
				-- line_down = '<A-Down>',
				-- line_up = '<A-Up>',
			},

      -- Options which control moving behavior
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
	end,
}
