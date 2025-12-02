return {
	"Shatur/neovim-session-manager",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	keys = {
		{ "<leader>zl", "<cmd>SessionManager load_session<cr>", desc = "Load session" },
		{ "<leader>zs", "<cmd>SessionManager save_current_session<cr>", desc = "Save session" },
		{ "<leader>zd", "<cmd>SessionManager delete_session<cr>", desc = "Delete session" },
	},
	config = function()
		local config = require("session_manager.config")
		require("session_manager").setup({
			autoload_mode = config.AutoloadMode.CurrentDir,
			autosave_last_session = true,
			autosave_only_in_session = true,
			autosave_ignore_buftypes = { "terminal" },
		})
	end,
}
