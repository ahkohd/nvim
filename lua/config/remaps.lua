-- luacheck: globals vim

local map = vim.api.nvim_set_keymap

-- Helper function to skip terminal buffers
local function switch_buffer(direction)
	local start_buf = vim.api.nvim_get_current_buf()
	local cmd = direction == "next" and "bnext" or "bprev"

	vim.cmd(cmd)
	local current_buf = vim.api.nvim_get_current_buf()
	local attempts = 0
	local max_attempts = vim.fn.bufnr("$")

	-- Keep switching until we find a non-terminal buffer or we've tried all buffers
	while vim.bo[current_buf].buftype == "terminal" and attempts < max_attempts do
		vim.cmd(cmd)
		current_buf = vim.api.nvim_get_current_buf()
		attempts = attempts + 1

		-- If we've cycled back to start, break
		if current_buf == start_buf then
			break
		end
	end
end

map("n", "<C-d>", "<C-d>zz", { noremap = true })

map("n", "<C-u>", "<C-u>zz", { noremap = true })

map("n", "n", "nzzzv", { noremap = true })

map("n", "N", "Nzzzv", { noremap = true })

-- Buffer navigation (skip terminal buffers)
vim.keymap.set("n", "<Left>", function()
	switch_buffer("prev")
end, { noremap = true, silent = true, desc = "Previous buffer (skip terminal)" })

vim.keymap.set("n", "<Right>", function()
	switch_buffer("next")
end, { noremap = true, silent = true, desc = "Next buffer (skip terminal)" })

-- Jumplist navigation
map("n", "<Up>", "<C-o>zz", { noremap = true, silent = true, desc = "Jump to older position" })
map("n", "<Down>", "<C-i>zz", { noremap = true, silent = true, desc = "Jump to newer position" })

-- Quickfix navigation
map("n", "<C-o>", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix item" })
map("n", "<C-i>", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix item" })

-- Terminal mode mappings
map("t", ";;", "<C-\\><C-n>", { noremap = true, silent = true })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Navigate to left split" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Navigate to bottom split" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Navigate to top split" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate to right split" })

-- Quick file operations
map("n", "<leader>h", ":e!<CR>", { noremap = true, silent = true, desc = "Refresh file" })

-- Quick quit commands (like vim's ZZ and ZQ)
map("n", "ZQ", ":qa!<CR>", { noremap = true, silent = true, desc = "Force quit all (no save)" })
map("n", "ZZ", ":xa<CR>", { noremap = true, silent = true, desc = "Save all and quit" })
map("n", "zq", ":q!<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- Save file
map("n", "<leader>s", ":w<CR>", { noremap = true, silent = true, desc = "Save" })

-- Execute Lua file
map("n", "<leader>x", ":luafile %<CR>:echo 'Sourced ' . expand('%')<CR>", { noremap = true, desc = "Execute Lua file" })

-- Quickfix list
-- map("n", "<leader>qo", ":copen<CR>", { noremap = true, silent = true, desc = "Open quickfix list" })
map(
	"n",
	"<leader>qq",
	":call setqflist([])<CR>:cclose<CR>",
	{ noremap = true, silent = true, desc = "Clear and close quickfix" }
)
map(
	"n",
	"<leader>qd",
	"<cmd>lua vim.diagnostic.setqflist()<CR>",
	{ noremap = true, silent = true, desc = "Diagnostics to quickfix" }
)
map("n", "<leader>qs", ":vimgrep /<C-r>//g %<CR>:copen<CR>", { noremap = true, desc = "Search results to quickfix" })

-- Location list commands
-- map("n", "<leader>lo", ":lopen<CR>", { noremap = true, silent = true, desc = "Open location list" })
map("n", "<leader>lq", ":lclose<CR>", { noremap = true, silent = true, desc = "Close location list" })
map("n", "<C-S-I>", ":lnext<CR>", { noremap = true, silent = true, desc = "Next location item" })
map("n", "<C-S-o>", ":lprev<CR>", { noremap = true, silent = true, desc = "Previous location item" })
