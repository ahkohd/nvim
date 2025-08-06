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
				-- Check if launched with DiffEditor command
				local cmdline = vim.v.argv or {}
				local is_diffeditor = false
				for i, arg in ipairs(cmdline) do
					if arg == "-c" and cmdline[i + 1] and cmdline[i + 1]:match("^DiffEditor") then
						is_diffeditor = true
						break
					end
				end

				-- Only load the session if nvim was started with no args and not DiffEditor
				if vim.fn.argc() == 0 and not is_diffeditor then
					-- Small delay to ensure all plugins are loaded
					vim.defer_fn(function()
						require("persistence").load()
					end, 50)
				end
			end,
		})
	end,
}
