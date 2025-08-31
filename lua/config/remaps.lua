-- luacheck: globals vim

local map = vim.api.nvim_set_keymap

map("n", "<C-d>", "<C-d>zz", { noremap = true })

map("n", "<C-u>", "<C-u>zz", { noremap = true })

map("n", "<C-i>", "<C-i>zz", { noremap = true })

map("n", "<C-o>", "<C-o>zz", { noremap = true })

map("n", "n", "nzzzv", { noremap = true })

map("n", "N", "Nzzzv", { noremap = true })

-- Buffer navigation
map("n", "<C-S-O>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<C-S-I>", ":bnext<CR>", { noremap = true, silent = true })

-- Terminal mode mappings
map("t", ";;", "<C-\\><C-n>", { noremap = true, silent = true })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Navigate to left split" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Navigate to bottom split" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Navigate to top split" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate to right split" })

-- Quick quit commands (like vim's ZZ and ZQ)
map("n", "ZQ", ":qa!<CR>", { noremap = true, silent = true, desc = "Force quit all (no save)" })
map("n", "ZZ", ":xa<CR>", { noremap = true, silent = true, desc = "Save all and quit" })
map("n", "zq", ":q!<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- Save file
map("n", "<leader><CR>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Quickfix navigation
map("n", "<C-S-j>", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix item" })
map("n", "<C-S-k>", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix item" })
map("n", "<leader>qo", ":copen<CR>", { noremap = true, silent = true, desc = "Open quickfix list" })
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
map("n", "<leader>lo", ":lopen<CR>", { noremap = true, silent = true, desc = "Open location list" })
map("n", "<leader>lq", ":lclose<CR>", { noremap = true, silent = true, desc = "Close location list" })
map("n", "<M-S-j>", ":lnext<CR>", { noremap = true, silent = true, desc = "Next location item" })
map("n", "<M-S-k>", ":lprev<CR>", { noremap = true, silent = true, desc = "Previous location item" })

-- Toggle light/dark background
vim.keymap.set("n", "<leader>b", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, { desc = "Toggle background light/dark" })
