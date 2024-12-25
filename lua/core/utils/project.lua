-- luacheck: globals vim

local M = {}

M.root_dir = function()
	return vim.fs.dirname(vim.fs.find(".git", { path = vim.fn.getcwd(), upward = true })[1])
end

M.root_file = function(files)
	local dirname = vim.fn.expand("%:p:h")
	local found = vim.fs.find(files, { upward = true, path = dirname })[1]
	if found then
		return vim.fs.dirname(found)
	end
end

return M
