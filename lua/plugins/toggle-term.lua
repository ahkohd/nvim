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
		{
			"<space>1",
			function()
				_btop_toggle()
			end,
			desc = "Toggle btop",
		},
		{
			"<space>t1",
			"<cmd>ToggleTerm<cr>",
			desc = "Toggle Terminal #1",
		},
		{
			"<space>t2",
			"<cmd>2ToggleTerm<cr>",
			desc = "Toggle Terminal #2",
		},
		{
			"<space>t3",
			"<cmd>3ToggleTerm<cr>",
			desc = "Toggle Terminal #2",
		},
		{
			"<space>t4",
			"<cmd>4ToggleTerm<cr>",
			desc = "Toggle Terminal #4",
		},
		{
			"<space>t5",
			"<cmd>5ToggleTerm<cr>",
			desc = "Toggle Terminal #5",
		},
		{
			"<space>t6",
			"<cmd>6ToggleTerm<cr>",
			desc = "Toggle Terminal #6",
		},
		{
			"<space>t0",
			"<cmd>TermSelect<cr>",
			desc = "Select Terminal",
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

		local btop = Terminal:new({
			cmd = "btop",
			direction = "float",
			on_open = function(term)
				vim.cmd("startinsert!")

				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<space>1",
					"<cmd>lua _btop_toggle()<CR>",
					{ noremap = true, silent = true }
				)
			end,
			on_close = function()
				vim.cmd("startinsert!")
			end,
		})

		function _btop_toggle()
			btop:toggle()
		end
	end,
}
