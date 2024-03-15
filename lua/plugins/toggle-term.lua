-- luacheck: globals vim

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	keys = {
		{ "<space><tab>", desc = "Open Terminal" },
		{
			"<space>q",
			function()
				_mprocs_toggle()
			end,
			desc = "Toggle mprocs",
		},
	},
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = [[<space><tab>]],
			direction = "float",
			size = 80,
			start_in_insert = false,
			insert_mappings = false,
			float_opts = {
				border = "curved",
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		local mprocs = Terminal:new({
			cmd = "mprocs",
			direction = "float",
			on_open = function(term)
				vim.cmd("startinsert!")

				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<space>q",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		function _mprocs_toggle()
			mprocs:toggle()
		end
	end,
}
