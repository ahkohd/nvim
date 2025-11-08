-- luacheck: globals vim

local lua_globals = {
	"vim",
	"packer_plugins",
	"api",
	"fn",
	"loop",
}

local win_get_buf = vim.api.nvim_win_get_buf
local wo = vim.wo
local buf_line_count = vim.api.nvim_buf_line_count
local win_get_width = vim.api.nvim_win_get_width
local buf_get_lines = vim.api.nvim_buf_get_lines
local str_width = vim.fn.strwidth
local replace_termcodes = vim.api.nvim_replace_termcodes
local get_win_info = vim.fn.getwininfo
local win_is_valid = vim.api.nvim_win_is_valid
local keymap_del = vim.keymap.del
local feedkeys = vim.fn.feedkeys
local defer = vim.defer_fn
local buf_call = vim.api.nvim_buf_call
local nvim_cmd = vim.api.nvim_cmd
local exec_autocmds = vim.api.nvim_exec_autocmds
local win_close = vim.api.nvim_win_close
local keymap_set = vim.keymap.set

-- See: https://github.com/telemachus/dotfiles/blob/main/config/nvim/lua/lsp.lua#L44-L177
-- Wrap neovim's floating windows.  This allows us to change some settings
-- and add keymaps that require information we can't get at otherwise.
--
-- The code was inspired by noice.nvim, a user's dotfiles, and two GitHub
-- issues.  See links below for details.
--
-- + https://github.com/folke/noice.nvim
-- + https://bit.ly/3YyX54v
-- + https://github.com/neovim/neovim/issues/27288
-- + https://github.com/neovim/neovim/issues/20146

---Return the height of the buffer in the window.
---@param win_id integer
---@return integer
local win_buf_height = function(win_id)
	local buf = win_get_buf(win_id)

	-- If the buffer is not wrapped, the number of lines is straightforward.
	if not wo[win_id].wrap then
		return buf_line_count(buf)
	end

	local width = win_get_width(win_id)

	-- Compute the height of the buffer in the window.
	local lines = buf_get_lines(buf, 0, -1, false)
	local height = 0
	for _, line in ipairs(lines) do
		height = height + math.max(1, (math.ceil(str_width(line) / width)))
	end

	return height
end

local escape_keycodes = function(str)
	return replace_termcodes(str, true, true, true)
end

---Scroll the window by a given number of lines.
---@param win_id integer
---@param num integer
local scroll = function(win_id, num)
	-- Delete the keymaps on "<C-f>" and "<C-b>" after the hover closes.
	if not win_is_valid(win_id) then
		keymap_del("n", "<C-d>", { buffer = true })
		keymap_del("n", "<C-u>", { buffer = true })
		if num > 0 then
			feedkeys(escape_keycodes("<C-d>"))
		else
			feedkeys(escape_keycodes("<C-u>"))
		end

		return
	end

	local info = get_win_info(win_id)[1] or {}
	local top = info.topline or 1
	local buf = win_get_buf(win_id)
	top = top + num
	top = math.max(top, 1)
	top = math.min(top, win_buf_height(win_id) - info.height + 1)

	defer(function()
		buf_call(buf, function()
			-- TODO: Investigate whether nvim_cmd > nvim_command here.
			-- nvim_cmd("noautocmd silent! normal! " .. top .. "zt")
			nvim_cmd({
				cmd = "normal",
				args = { top .. "zt" },
				bang = true,
				mods = { noautocmd = true, emsg_silent = true },
			}, {})
			exec_autocmds("WinScrolled", { modeline = false })
		end)
	end, 0)
end

---Close a floating window without entering it.
---@param win_id integer
local close_window = function(win_id)
	-- Delete the keymap on "<Leader>;" after the hover closes.
	if not win_is_valid(win_id) then
		keymap_del("n", "q", { buffer = true })
		feedkeys(escape_keycodes("q"))

		return
	end

	win_close(win_id, false)
end

---Wrap the function that opens floating windows in order to customize them.
---@param opener fun(contents: table, syntax: string, opts: table): integer?, integer?
---@return fun(contents: table, syntax: string, opts: table): integer?, integer?
local float_wrapper = function(opener)
	return function(contents, syntax, opts)
		local buf_id, win_id = opener(contents, syntax, opts)

		-- Return if the buffer or window is not created.
		if not buf_id or not win_id then
			return buf_id, win_id
		end

		-- Don't add screen lines above or below the cursor, and don't indicate
		-- wrapping with the 'showbreak' character.
		wo[win_id].scrolloff = 0
		wo[win_id].showbreak = "NONE"

		-- TODO: decide how I want to handle conceal here.
		-- wo[win_id].conceallevel = 0
		wo[win_id].concealcursor = "n"

		-- Add custom keymaps: Ctrl-F and Ctrl-B for scrolling the hover window
		-- and <Leader>; to close the hover window.
		--
		-- The inner functions delete the keymaps once the window id is no
		-- longer valid.
		keymap_set("n", "<C-d>", function()
			scroll(win_id, 4)
		end, { silent = true, buffer = true })
		keymap_set("n", "<C-u>", function()
			scroll(win_id, -4)
		end, { silent = true, buffer = true })
		keymap_set("n", "q", function()
			close_window(win_id)
		end, { silent = true, buffer = true })

		return buf_id, win_id
	end
end

local default_opener = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = float_wrapper(default_opener)

local M = {
	lua_globals = lua_globals,

	on_attach = function(_client, buf)
		vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end,

	capabilities = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem = {
			snippetSupport = true,
		}

		-- extra capabilities for blink-cmp
		local isBlinkOk, blink = pcall(require, "blink.cmp")
		if isBlinkOk then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		return capabilities
	end,

	setup_appearance = function()
		local highlights = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		}

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				texthl = highlights,
				numhl = highlights,
			},
			underline = false,
			virtual_lines = false,
			update_in_insert = true,
		})

		keymap_set("n", "<leader>k", function()
			vim.lsp.buf.code_action()
		end, { desc = "Diagnostics or Code Actions" })

		keymap_set("n", "<leader>K", function()
			local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
			if #diagnostics > 0 then
				vim.diagnostic.open_float(nil, { focusable = true, source = "if_many" })
			end
		end, {
			desc = "Code Actions",
		})
	end,
}

return M
