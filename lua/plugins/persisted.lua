-- luacheck: globals vim

return {
	"olimorris/persisted.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>w",
			"<cmd>SessionSelect<cr>",
			desc = "Session",
		},
	},
	config = function()
		local save_dir = vim.fn.stdpath("data") .. "/sessions/"

		if vim.fn.isdirectory(save_dir) == 0 then
			vim.fn.mkdir(save_dir, "p")
		end

		require("persisted").setup({
			autostart = true,
			autoload = true,
			save_dir = save_dir,
			follow_cwd = true,
			use_git_branch = false,
			allowed_dirs = { "~/Developer/", "~/nvim", "~/.dotfiles" },
			should_save = function()
				-- Don't save sessions for certain file types or terminals
				if vim.bo.filetype == "alpha" or vim.bo.filetype == "" or vim.bo.buftype == "terminal" then
					return false
				end
				return true
			end,
		})

		-- Set up autocmds to clear buffers after loading sessions
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedLoadPost",
			callback = function()
				local current_buf = vim.api.nvim_get_current_buf()
				-- Clear all buffers except current and terminals
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_valid(buf) and buf ~= current_buf and vim.bo[buf].buftype ~= "terminal" then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end,
		})
	end,
}
