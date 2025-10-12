-- luacheck: globals vim

local M = {}

local ns = vim.api.nvim_create_namespace("git_blame")
local timer = nil
local git_user_name = nil

-- Get git user name once
local function get_git_user_name()
	if git_user_name then
		return git_user_name
	end

	local handle = io.popen("git config user.name")
	if handle then
		git_user_name = handle:read("*a"):gsub("%s+$", "")
		handle:close()
	end
	return git_user_name
end

local function show_blame()
	vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

	local file = vim.fn.expand("%:p")
	local line = vim.fn.line(".")

	if vim.fn.filereadable(file) == 0 then
		return
	end

	local cmd = string.format(
		"git -C %s blame -L %d,%d --line-porcelain %s",
		vim.fn.shellescape(vim.fn.fnamemodify(file, ":h")),
		line,
		line,
		vim.fn.shellescape(vim.fn.fnamemodify(file, ":t"))
	)

	vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if not data or #data == 0 then
				return
			end

			local author, date, summary, commit_hash
			for _, line_data in ipairs(data) do
				if line_data:match("^%x+ ") and not commit_hash then
					-- First line contains commit hash
					commit_hash = line_data:match("^(%x+)")
				elseif line_data:match("^author ") then
					author = line_data:gsub("^author ", "")
				elseif line_data:match("^author%-time ") then
					local timestamp = tonumber((line_data:gsub("^author%-time ", "")))
					if timestamp then
						date = os.date("%b. %d/%y", timestamp)
					end
				elseif line_data:match("^summary ") then
					summary = line_data:gsub("^summary ", "")
				end
			end

			-- Check if uncommitted (commit hash is all zeros)
			if commit_hash and commit_hash:match("^0+$") then
				local text = "  Uncommitted"
				vim.api.nvim_buf_set_extmark(0, ns, line - 1, 0, {
					virt_text = { { text, "Comment" } },
					virt_text_pos = "eol",
				})
			elseif author and date and summary then
				-- Replace author with "You" if it matches git user.name
				local display_author = author
				local user_name = get_git_user_name()
				if user_name and author == user_name then
					display_author = "You"
				end

				local text = string.format("  %s, %s • %s", display_author, date, summary)
				vim.api.nvim_buf_set_extmark(0, ns, line - 1, 0, {
					virt_text = { { text, "Comment" } },
					virt_text_pos = "eol",
				})
			end
		end,
	})
end

local function debounced_show_blame()
	-- Clear immediately when cursor moves
	vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

	if timer then
		timer:stop()
	end
	timer = vim.defer_fn(show_blame, 2000)
end

function M.setup()
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		callback = debounced_show_blame,
	})
end

return M
