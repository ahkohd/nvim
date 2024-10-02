-- luacheck: globals vim

local M = {}

M.filetype = function()
	local bufnr = vim.api.nvim_get_current_buf()

	return vim.bo[bufnr].filetype
end

return M
