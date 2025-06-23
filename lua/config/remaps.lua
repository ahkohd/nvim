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

-- map("t", "??", "<C-\\><C-n>", { noremap = true, silent = true })
