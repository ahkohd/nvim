-- luacheck: globals vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()

		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("config.opts")

if vim.g.neovide then
	require("config.neovide")
end

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "tokyonight-night" } },
	checker = { enabled = false },
})

-- Setup bg.lua
local bg = require("config.bg")
bg.setup()

-- Load saved theme from themify state immediately (before VeryLazy plugins load)
-- This ensures your theme applies instantly while themify loads in background
local themify_state_path = vim.fn.stdpath("data") .. "/themify/state.json"
if vim.fn.filereadable(themify_state_path) == 1 then
	local ok, state = pcall(vim.fn.json_decode, vim.fn.readfile(themify_state_path))
	if ok and state and state.theme then
		pcall(vim.cmd.colorscheme, state.theme)
		-- Apply terminal background (deferred to ensure highlights are loaded)
		vim.defer_fn(function()
			bg.update()
		end, 10)
	end
end

