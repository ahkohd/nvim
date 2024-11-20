-- luacheck: globals vim

-- Set various options
vim.o.termguicolors = true
vim.o.background = "dark"
vim.wo.number = true
vim.o.fileencodings = "utf-8,sjis,euc-jp,latin"
vim.o.encoding = "utf-8"
vim.o.title = true
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.mouse = ""
vim.o.cmdheight = 0
vim.o.laststatus = 2
vim.wo.scrolloff = 10
vim.o.expandtab = true
vim.o.shell = "zsh"
vim.o.backupskip = "/tmp/*,/private/tmp/*"
vim.o.showtabline = 0
vim.opt.swapfile = false

-- vim.g.loaded_netrwPlugin = 0

-- Don't redraw while executing macros (good performance config)
-- vim.o.lazyredraw = true

-- Uncomment if you want to use these options
-- vim.o.showmatch = true
-- vim.o.mat = 2

-- Ignore case when searching
vim.o.ignorecase = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.wrap = false -- No wrap lines
vim.o.backspace = "start,eol,indent"

-- Finding files - Search down into subfolders
vim.o.path = vim.o.path .. ",**"
vim.o.wildignore = vim.o.wildignore .. ",*/node_modules/*"

-- Turn off paste mode when leaving insert
vim.cmd("autocmd InsertLeave * set nopaste")

-- Add asterisks in block comments
vim.o.formatoptions = vim.o.formatoptions .. "r"

-- Highlights
vim.opt.cursorline = false

-- Extras
vim.o.exrc = true

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- Conceal
vim.o.conceallevel = 2
vim.g["pencil#conceallevel"] = 2

-- register command that calls a lua function
vim.cmd("command! -nargs=0 ProjectRoot lua require('core.utils.project').cwd_to_root_dir_of_current_buffer()")

require("config.remaps")
