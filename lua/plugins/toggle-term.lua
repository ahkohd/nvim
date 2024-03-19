-- luacheck: globals vim

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	keys = {
		{
			"<space><tab>",
			function()
				_zsh_toggle()
			end,
			desc = "Open Terminal",
		},
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
			direction = "float",
			size = 80,
			start_in_insert = false,
			insert_mappings = false,
			float_opts = {
				border = "curved",
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		local zsh = Terminal:new({
			cmd = "zsh",
			direction = "float",
			on_open = function(term)
				vim.cmd("startinsert!")

				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<space><tab>",
					"<cmd>lua _zsh_toggle()<CR>",
					{ noremap = true, silent = true }
				)
			end,
			on_close = function()
				vim.cmd("startinsert!")
			end,
		})

		function _zsh_toggle()
			zsh:toggle()
		end

		local mprocs = Terminal:new({
			cmd = "mprocs",
			direction = "float",
			on_open = function(term)
				vim.cmd("startinsert!")

				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<space>q",
					"<cmd>lua _mprocs_toggle()<CR>",
					{ noremap = true, silent = true }
				)
			end,
			on_close = function()
				vim.cmd("startinsert!")
			end,
		})

		function _mprocs_toggle()
			mprocs:toggle()
		end
	end,
}
