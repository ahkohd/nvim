-- luacheck: globals vim

vim.g.toggle_statusline = false

vim.g.default_laststatus = vim.o.laststatus

local M = {}

M.toggle = function()
	if vim.g.toggle_statusline then
		M.show()
	else
		M.hide()
	end
end

M.hide = function()
	local ok, lualine = pcall(require, "lualine")

	if ok then
		vim.g.toggle_statusline = false

		lualine.hide({
			place = { "statusline" },
			unhide = false,
		})

		vim.o.laststatus = 0
	end
end

M.show = function()
	local ok, lualine = pcall(require, "lualine")

	if ok then
		vim.g.toggle_statusline = true

		lualine.hide({ unhide = true })

		vim.o.laststatus = vim.g.default_laststatus
	end
end

return M
