-- luacheck: globals vim

return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	event = "LspAttach",
	keys = {
		{
			"<space>k",
			function()
				local utils = require("core.utils.buffer")

				if utils.filetype() == "rust" then
					vim.cmd.RustLsp("codeAction")
				else
					require("tiny-code-action").code_action()
				end
			end,
			desc = "Show code action",
		},
	},
	config = function()
		require("tiny-code-action").setup({
			telescope_opts = {
				initial_mode = "normal",
			},
		})
	end,
}
