-- luacheck: globals vim

return {
	dir = "~/.config/nvim/lua/plugins",
	cmd = "FloatTerminal",
	keys = {
		{
			"<C-;>",
			"<cmd>FloatTerminal<cr>",
			desc = "Toggle floating terminal",
			mode = { "n", "t" },
		},
	},
	opts = {
		width = nil,
		height = nil,
	},
	config = function()
		local state = {
			floating = {
				buf = -1,
				win = -1,
			},
		}

		local function create_floating_window(opts)
			opts = opts or {}
			local width = opts.width or math.floor(vim.o.columns * 0.8)
			local height = opts.height or math.floor(vim.o.lines * 0.8)

			-- calculate the position to center the window
			local col = math.floor((vim.o.columns - width) / 2)
			local row = math.floor((vim.o.lines - height) / 2)

			-- create a buffer
			local buf = nil
			if vim.api.nvim_buf_is_valid(opts.buf) then
				buf = opts.buf
			else
				buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
			end

			local win_config = {
				relative = "editor",
				width = width,
				height = height,
				col = col,
				row = row,
				style = "minimal",
				border = "rounded",
			}

			-- create the floating window
			local win = vim.api.nvim_open_win(buf, true, win_config)

			return { buf = buf, win = win }
		end

		local function toggle_terminal()
			if not vim.api.nvim_win_is_valid(state.floating.win) then
				state.floating = create_floating_window({ buf = state.floating.buf })
				if vim.bo[state.floating.buf].buftype ~= "terminal" then
					vim.cmd.terminal()

					vim.keymap.set("t", "??", "<c-\\><c-n>", {
						buffer = state.floating.buf,
						noremap = true,
						silent = true,
						desc = "Exit terminal mode",
					})
				end

				vim.cmd("startinsert")
			else
				vim.api.nvim_win_hide(state.floating.win)
			end
		end

		vim.api.nvim_create_user_command("FloatTerminal", toggle_terminal, {})
	end,
}
