-- luacheck: globals vim

return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	event = "VeryLazy",
	config = function()
		require("cmp_luasnip")

		-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
		-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
		vim.api.nvim_set_keymap(
			"i",
			"<Tab>",
			"luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
			{ expr = true, noremap = true, silent = true }
		)
		-- -1 for jumping backwards.
		vim.api.nvim_set_keymap(
			"i",
			"<S-Tab>",
			"<cmd>lua require'luasnip'.jump(-1)<Cr>",
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"s",
			"<Tab>",
			"<cmd>lua require'luasnip'.jump(1)<Cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"s",
			"<S-Tab>",
			"<cmd>lua require'luasnip'.jump(-1)<Cr>",
			{ noremap = true, silent = true }
		)

		-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
		vim.api.nvim_set_keymap(
			"i",
			"<C-E>",
			"luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
			{ expr = true, noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"s",
			"<C-E>",
			"luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
			{ expr = true, noremap = true, silent = true }
		)

		-- Add my snippets
		require("core.snippets").load()
	end,
}
