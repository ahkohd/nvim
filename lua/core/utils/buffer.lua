local M = {}

-- Define special buffer types that should disable certain keybindings
M.special_buffers = { "difft", "terminal", "float_terminal" }

M.filetype = function()
	local bufnr = vim.api.nvim_get_current_buf()

	return vim.bo[bufnr].filetype
end

-- Check if any window has specified buffer type(s)
-- @param filetypes string|table Single filetype or list of filetypes to check
-- @return boolean true if any window has a matching filetype
M.has_buffer_type = function(filetypes)
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

-- Check if any special buffer is currently open
-- @return boolean true if any special buffer is open
M.in_special_buffer = function()
	return M.has_buffer_type(M.special_buffers)
end

return M
