-- luacheck: globals vim

local M = {}

function M.setup(opts)
	opts = opts or {}

	local state = {
		terminals = {},
		yazi_win = -1,
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
		local buf
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

		-- add title if provided
		if config.title then
			win_config.title = config.title
			win_config.title_pos = "center"
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

	-- General function to check if any window has specified buffer type(s)
	-- @param filetypes string|table Single filetype or list of filetypes to check
	-- @return boolean true if any window has a matching filetype
	local function has_buffer_type(filetypes)
		-- Normalize to table
		if type(filetypes) == "string" then
			filetypes = { filetypes }
		end

		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_is_valid(win) then
				local buf = vim.api.nvim_win_get_buf(win)
				local ft = vim.bo[buf].filetype
				for _, check_ft in ipairs(filetypes) do
					if ft == check_ft then
						return true
					end
				end
			end
		end
		return false
	end

	local function in_special_buffer()
		return has_buffer_type("difft")
	end

	local function hide_sidekick()
		local ok, sidekick_cli = pcall(require, "sidekick.cli")
		if ok then
			-- Check if there's a visible sidekick window and toggle it off
			local has_visible = false
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				if vim.api.nvim_win_is_valid(win) then
					local buf = vim.api.nvim_win_get_buf(win)
					local ft = vim.bo[buf].filetype
					if ft == "sidekick_terminal" then
						has_visible = true
						break
					end
				end
			end
			if has_visible then
				sidekick_cli.toggle({ name = "claude" })
			end
		end
	end

	local function show_sidekick()
		-- Do nothing if in special buffer
		if in_special_buffer() then
			return
		end

		local ok, sidekick_cli = pcall(require, "sidekick.cli")
		if ok then
			sidekick_cli.show({ name = "claude", focus = true })
		end
	end

	local function is_sidekick_open()
		return has_buffer_type("sidekick_terminal")
	end

	local function open_yazi()
		-- Do nothing if sidekick or special buffer is open
		if is_sidekick_open() or in_special_buffer() then
			return
		end

		-- Check if yazi window is already open - if so, close it
		if vim.api.nvim_win_is_valid(state.yazi_win) then
			vim.api.nvim_win_close(state.yazi_win, true)
			state.yazi_win = -1
			return
		end

		-- Get current file's path
		local current_file = vim.fn.expand("%:p")

		-- Create temp file for yazi to write chosen file
		local temp_file = vim.fn.tempname()

		-- Build yazi command with chooser file and current file (if exists)
		local yazi_cmd
		if current_file ~= "" and vim.fn.filereadable(current_file) == 1 then
			-- Start yazi with current file selected
			yazi_cmd = string.format("yazi --chooser-file='%s' '%s'", temp_file, current_file)
		else
			-- Start yazi in current working directory
			yazi_cmd = string.format("yazi --chooser-file='%s' '%s'", temp_file, vim.fn.getcwd())
		end

		-- Create a new buffer for yazi
		local buf = vim.api.nvim_create_buf(false, true)

		-- Set filetype for float terminal
		vim.bo[buf].filetype = "float_terminal"

		local win_config = opts.layout == "float" and get_float_layout({}) or get_ivy_taller_layout({})
		win_config.title = " Yazi "
		win_config.title_pos = "center"

		local win = vim.api.nvim_open_win(buf, true, win_config)
		state.yazi_win = win

		-- Run yazi in terminal
		vim.fn.termopen(yazi_cmd, {
			on_exit = function()
				-- Close the window
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
				state.yazi_win = -1

				-- Read the chosen file
				if vim.fn.filereadable(temp_file) == 1 then
					local chosen_file = vim.fn.readfile(temp_file)[1]
					if chosen_file and chosen_file ~= "" then
						-- Open the file in nvim
						vim.schedule(function()
							vim.cmd("edit " .. vim.fn.fnameescape(chosen_file))
						end)
					end
					-- Clean up temp file
					vim.fn.delete(temp_file)
				end
			end,
		})

		-- Add buffer-local keybindings for yazi (intercepts before yazi sees them)
		vim.keymap.set("t", ";q", function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			state.yazi_win = -1
		end, {
			buffer = buf,
			noremap = true,
			silent = true,
			desc = "Close Yazi",
		})

		vim.keymap.set("t", ";<esc>", function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			state.yazi_win = -1
		end, {
			buffer = buf,
			noremap = true,
			silent = true,
			desc = "Close Yazi",
		})

		vim.defer_fn(function()
			vim.cmd("startinsert")
		end, 10)
	end

	local function toggle_terminal(id, shell_cmd)
		id = id or 1

		-- Do nothing if sidekick or special buffer is open
		if is_sidekick_open() or in_special_buffer() then
			return
		end

		-- Special handling for yazi terminal
		if id == 3 then
			open_yazi()
			return
		end

		-- Check if any OTHER terminal is currently open
		for term_id, term in pairs(state.terminals) do
			if term_id ~= id and vim.api.nvim_win_is_valid(term.win) then
				-- Another terminal is open, do nothing
				return
			end
		end

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
			-- Show this terminal
			local result = create_floating_window({ buf = term.buf, title = term.title })
			term.buf = result.buf
			term.win = result.win

			if vim.bo[term.buf].buftype ~= "terminal" then
				if term.cmd then
					vim.cmd("terminal " .. term.cmd)
				else
					vim.cmd.terminal()
				end

				-- Set filetype for float terminal
				vim.bo[term.buf].filetype = "float_terminal"

				vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {
					buffer = term.buf,
					noremap = true,
					silent = true,
					desc = "Exit terminal mode",
				})
			end

			vim.defer_fn(function()
				vim.cmd("startinsert")
			end, 10)
		else
			-- This terminal is already open, hide it (toggle off)
			vim.api.nvim_win_hide(term.win)
		end
	end

	-- Initialize terminals from opts
	if opts.terminals then
		for _, terminal in ipairs(opts.terminals) do
			if terminal.id then
				state.terminals[terminal.id] = {
					buf = -1,
					win = -1,
					cmd = terminal.cmd,
					title = terminal.title,
				}
			end
		end
	end

	local function hide_current_terminal()
		local current_win = vim.api.nvim_get_current_win()

		-- Check if current window is yazi
		if current_win == state.yazi_win and vim.api.nvim_win_is_valid(state.yazi_win) then
			vim.api.nvim_win_close(state.yazi_win, true)
			state.yazi_win = -1
			return
		end

		-- Check regular terminals
		for _, term in pairs(state.terminals) do
			if term.win == current_win and vim.api.nvim_win_is_valid(term.win) then
				vim.api.nvim_win_hide(term.win)
				break
			end
		end
	end

	local function is_any_terminal_open()
		-- Check if yazi is open
		if vim.api.nvim_win_is_valid(state.yazi_win) then
			return true
		end

		-- Check if any regular terminal is open
		for _, term in pairs(state.terminals) do
			if vim.api.nvim_win_is_valid(term.win) then
				return true
			end
		end

		return false
	end

	-- Store the functions globally for access from keybindings
	_G.FloatTerminal = {
		toggle_terminal = toggle_terminal,
		hide_current_terminal = hide_current_terminal,
		is_any_terminal_open = is_any_terminal_open,
		has_buffer_type = has_buffer_type,
	}

	vim.api.nvim_create_user_command("FloatTerminal", function()
		toggle_terminal(1)
	end, {})

	-- Resize floating terminals on VimResized
	vim.api.nvim_create_autocmd("VimResized", {
		pattern = "*",
		callback = function()
			for _, term in pairs(state.terminals) do
				if vim.api.nvim_win_is_valid(term.win) then
					local win_config
					if opts.layout == "float" then
						win_config = get_float_layout({})
					else -- default to ivy_taller
						win_config = get_ivy_taller_layout({})
					end
					vim.api.nvim_win_set_config(term.win, win_config)
				end
			end
		end,
	})
end

return M
