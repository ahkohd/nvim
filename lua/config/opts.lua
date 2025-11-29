vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.wo.number = false
vim.o.relativenumber = false
vim.o.fileencodings = "utf-8,sjis,euc-jp,latin"
vim.o.title = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showcmd = true
vim.o.cmdheight = 0
vim.o.laststatus = 0
vim.wo.scrolloff = 10
vim.o.expandtab = true
vim.o.shell = "zsh"
vim.o.backupskip = "/tmp/*,/private/tmp/*"
vim.o.showtabline = 0
vim.opt.swapfile = false
vim.opt.shortmess:append("I")
vim.g.loaded_netrwPlugin = 0
vim.o.ignorecase = true
vim.o.signcolumn = "yes"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = false
vim.o.backspace = "start,eol,indent"
vim.o.exrc = true
vim.o.number = false
vim.o.conceallevel = 2
vim.g["pencil#conceallevel"] = 2
-- finding files - search down into subfolders
vim.o.path = vim.o.path .. ",**"
vim.o.wildignore = vim.o.wildignore .. ",*/node_modules/*"
vim.o.winborder = "rounded"

vim.opt.cursorline = false
-- Disable end of buffer tildes
vim.opt.fillchars = { eob = " ", vert = " " }
-- Reduce key sequence timeout
vim.opt.timeoutlen = 300 -- for mapped sequences (like jk for escape)
vim.opt.ttimeoutlen = 30 -- for terminal key codes
-- Faster CursorHold events (for LSP diagnostics, git signs, etc.)
-- vim.opt.updatetime = 250
vim.opt.undofile = true

-- Folding settings - auto-fold based on nesting level
-- vim.opt.foldlevel = 3
-- vim.opt.foldlevelstart = 3

require("config.autocmds")
require("config.remaps")
