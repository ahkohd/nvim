-- luacheck: globals vim

return {
	"Bekaboo/dropbar.nvim",
	event = "VeryLazy",
	config = function()
		require("dropbar").setup({
			menu = {
				scrollbar = {
					enable = false,
				},
			},
		})

		-- Make dropbar transparent
		vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })

		local dropbar = require("dropbar.api")
		vim.keymap.set("n", "<Leader>j", dropbar.pick, { desc = "Pick symbols in winbar" })
		vim.keymap.set("n", "[;", dropbar.goto_context_start, { desc = "Go to start of current context" })
		vim.keymap.set("n", "];", dropbar.select_next_context, { desc = "Select next context" })
	end,
}
