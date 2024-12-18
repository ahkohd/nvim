-- luacheck: globals vim

local M = {}

M.root_dir = function()
	return require("lspconfig.util").find_git_ancestor(vim.fn.getcwd())
end

M.root_file = function(files)
	local dirname = vim.fn.expand("%:p:h")
	local found = vim.fs.find(files, { upward = true, path = dirname })[1]
	if found then
		return vim.fs.dirname(found)
	end
end

M.cwd_to_root_dir = function()
	local root_dir = M.root_dir()
	vim.cmd([[cd ]] .. root_dir)
end

M.cwd_to_root_dir_of_current_buffer = function()
	vim.cmd([[cd %:p:h]])
	M.cwd_to_root_dir()
end

M.open_file = function(file_path)
	vim.cmd("edit " .. file_path)
	M.cwd_to_root_dir()
end

return M
