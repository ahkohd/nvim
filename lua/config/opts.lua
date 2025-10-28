-- luacheck: globals vim

vim.g.mapleader = " "

vim.g.maplocalleader = "\\"

vim.o.termguicolors = true

vim.wo.number = true

vim.o.fileencodings = "utf-8,sjis,euc-jp,latin"

vim.o.encoding = "utf-8"

vim.o.title = true

vim.o.hlsearch = true

vim.o.showcmd = true

vim.o.cmdheight = 0

vim.o.laststatus = 0

vim.wo.scrolloff = 10

vim.o.expandtab = true

vim.o.shell = "zsh"

vim.o.backupskip = "/tmp/*,/private/tmp/*"

vim.o.showtabline = 0

vim.opt.swapfile = false

-- disable intro message
vim.opt.shortmess:append("I")

vim.g.loaded_netrwPlugin = 0

vim.o.ignorecase = true

vim.o.shiftwidth = 2

vim.o.tabstop = 2

vim.o.wrap = false

vim.o.backspace = "start,eol,indent"

vim.o.exrc = true

vim.o.number = true

vim.o.relativenumber = true

vim.o.conceallevel = 2

vim.g["pencil#conceallevel"] = 2

vim.opt.cursorline = false

-- Disable end of buffer tildes
vim.opt.fillchars = { eob = " " }

-- Reduce key sequence timeout
vim.opt.timeoutlen = 300 -- for mapped sequences (like jk for escape)
vim.opt.ttimeoutlen = 30 -- for terminal key codes

-- Faster CursorHold events (for LSP diagnostics, git signs, etc.)
-- vim.opt.updatetime = 250

-- finding files - search down into subfolders
vim.o.path = vim.o.path .. ",**"

vim.o.wildignore = vim.o.wildignore .. ",*/node_modules/*"

-- turn off paste mode when leaving insert
vim.cmd("autocmd InsertLeave * set nopaste")

-- Prevent terminal buffers from automatically entering insert mode
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
vim.cmd("autocmd TermOpen * stopinsert") -- Stay in normal mode

require("config.remaps")
