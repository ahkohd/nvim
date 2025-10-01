-- luacheck: globals vim

return {
	dir = "~/.config/nvim/lua/plugins",
	cmd = "FloatTerminal",
	keys = {
		{
			";s",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(1)
				end
			end,
			desc = "Toggle floating terminal #1",
			mode = { "n", "t" },
		},
		{
			";d",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(2)
				end
			end,
			desc = "Toggle floating terminal #2",
			mode = { "n", "t" },
		},
		{
			";f",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(3)
				end
			end,
			desc = "Toggle floating terminal #3",
			mode = { "n", "t" },
		},
		{
			";<esc>",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.hide_current_terminal()
				end
			end,
			desc = "Hide current floating terminal",
			mode = { "n", "t" },
		},
		{
			";q",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.hide_current_terminal()
				end
			end,
			desc = "Hide current floating terminal",
			mode = { "n", "t" },
		},
	},
	opts = {
		layout = "ivy_taller", -- "float" or "ivy_taller"
		width = nil,
		height = nil,
		exclusive = true, -- when true, only one terminal can be visible at a time
		terminals = {
			-- { id = 1, cmd = 'claude --continue "$@" 2>/dev/null || claude "$@"' }, -- claude
			{ id = 1, cmd = nil }, -- default shell
			{ id = 2, cmd = nil },
			{ id = 3, cmd = nil },
		},
	},
	config = function(_, opts)
		local state = {
			terminals = {},
		}

		local function get_float_layout(config)
			config = config or {}
			local width = config.width or math.floor(vim.o.columns * 0.8)
			local height = config.height or math.floor(vim.o.lines * 0.6)

			-- center the window
			local col = math.floor((vim.o.columns - width) / 2)
			local row = math.floor((vim.o.lines - height) / 2)

			return {
				relative = "editor",
				width = width,
				height = height,
				col = col,
				row = row,
				style = "minimal",
				border = "rounded",
			}
		end

		local function get_ivy_taller_layout(config)
			config = config or {}
			local width = config.width or vim.o.columns
			local height = config.height or math.floor(vim.o.lines * 0.8)

			-- position at bottom like ivy_taller
			local col = 0
			local row = vim.o.lines - height

			return {
				relative = "editor",
				width = width,
				height = height,
				col = col,
				row = row,
				style = "minimal",
				border = "rounded",
			}
		end

		local function create_floating_window(config)
			config = config or {}

			-- create a buffer
			local buf = nil
			if vim.api.nvim_buf_is_valid(config.buf) then
				buf = config.buf
			else
				buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
			end

			-- get window configuration based on layout
			local win_config
			if opts.layout == "float" then
				win_config = get_float_layout(config)
			else -- default to ivy_taller
				win_config = get_ivy_taller_layout(config)
			end

			-- create the floating window
			local win = vim.api.nvim_open_win(buf, true, win_config)

			return { buf = buf, win = win }
		end

		local function hide_other_terminals(current_id)
			for term_id, term in pairs(state.terminals) do
				if term_id ~= current_id and vim.api.nvim_win_is_valid(term.win) then
					vim.api.nvim_win_hide(term.win)
				end
			end
		end

		local function toggle_terminal(id, shell_cmd)
			id = id or 1

			-- Initialize terminal state if it doesn't exist
			if not state.terminals[id] then
				state.terminals[id] = {
					buf = -1,
					win = -1,
					cmd = shell_cmd,
				}
			end

			local term = state.terminals[id]

			if not vim.api.nvim_win_is_valid(term.win) then
				-- Hide other terminals if exclusive mode is enabled
				if opts.exclusive then
					hide_other_terminals(id)
				end
				local result = create_floating_window({ buf = term.buf })
				term.buf = result.buf
				term.win = result.win

				if vim.bo[term.buf].buftype ~= "terminal" then
					if term.cmd then
						vim.cmd("terminal " .. term.cmd)
					else
						vim.cmd.terminal()
					end

					vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {
						buffer = term.buf,
						noremap = true,
						silent = true,
						desc = "Exit terminal mode",
					})
				end

				vim.cmd("startinsert")
			else
				vim.api.nvim_win_hide(term.win)
			end
		end

		-- Initialize terminals from opts
		if opts.terminals then
			for _, terminal in ipairs(opts.terminals) do
				if terminal.id and terminal.cmd then
					state.terminals[terminal.id] = {
						buf = -1,
						win = -1,
						cmd = terminal.cmd,
					}
				end
			end
		end

		local function hide_current_terminal()
			local current_win = vim.api.nvim_get_current_win()
			for _, term in pairs(state.terminals) do
				if term.win == current_win and vim.api.nvim_win_is_valid(term.win) then
					vim.api.nvim_win_hide(term.win)
					break
				end
			end
		end

		-- Store the functions globally for access from keybindings
		_G.FloatTerminal = {
			toggle_terminal = toggle_terminal,
			hide_current_terminal = hide_current_terminal,
		}

		vim.api.nvim_create_user_command("FloatTerminal", function()
			toggle_terminal(1)
		end, {})

		-- vim.api.nvim_create_autocmd("TermEnter", {
		--   pattern = "*",
		--   callback = function()
		--     vim.opt_local.mouse = ""
		--   end,
		-- })
	end,
}
