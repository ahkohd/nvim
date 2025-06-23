-- luacheck: globals vim
--
return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	init = function()
		-- Auto-restore session on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			group = vim.api.nvim_create_augroup("persistence_auto_restore", { clear = true }),
			nested = true,
			callback = function()
				-- Only load the session if nvim was started with no args
				if vim.fn.argc() == 0 then
					-- Small delay to ensure all plugins are loaded
					vim.defer_fn(function()
						require("persistence").load()
					end, 50)
				end
			end,
		})
	end,
}
