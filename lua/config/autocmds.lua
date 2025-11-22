vim.api.nvim_create_autocmd("InsertLeave", {
	desc = "Disable paste mode when leaving insert",
	callback = function()
		vim.opt.paste = false
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Configure terminal buffers",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd("stopinsert")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	desc = "Set quickfix window to bottom with fixed height",
	callback = function()
		vim.cmd("wincmd J")
		vim.cmd("resize 15")
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Open help windows vertically on the right",
	callback = function()
		if vim.bo.buftype == "help" then
			vim.cmd("wincmd L")
		end
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("self/last_location", {
		clear = true,
	}),
	desc = "Go to the last location when opening a buffer",
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight effect for yanked text",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
	group = vim.api.nvim_create_augroup("self/execute_cmd_and_stay", { clear = true }),
	desc = "Execute command and stay in the command-line window",
	callback = function(args)
		vim.keymap.set({ "n", "i" }, "<S-CR>", "<cr>q:", { buffer = args.buf })
		vim.keymap.set("n", "q", ":q<CR>", { buffer = args.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("self/big_file", { clear = true }),
	desc = "Disable features in big files",
	pattern = "bigfile",
	callback = function(args)
		vim.schedule(function()
			vim.bo[args.buf].syntax = vim.filetype.match({ buf = args.buf }) or ""
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("self/close_with_q", { clear = true }),
	desc = "Close with <q>",
	pattern = {
		"git",
		"help",
		"man",
		"qf",
		"scratch",
	},
	callback = function(args)
		if args.match ~= "help" or not vim.bo[args.buf].modifiable then
			vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("self/disable_help_conceal", { clear = true }),
	desc = "Disable conceal in modifiable help files",
	pattern = "help",
	callback = function(args)
		if vim.bo[args.buf].modifiable then
			vim.wo.conceallevel = 0
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("self/treesitter_folding", { clear = true }),
	desc = "Enable Treesitter folding",
	callback = function(args)
		local bufnr = args.buf

		-- Enable Treesitter folding when not in huge files and when Treesitter
		-- is working.
		if vim.bo[bufnr].filetype ~= "bigfile" and pcall(vim.treesitter.start, bufnr) then
			vim.api.nvim_buf_call(bufnr, function()
				vim.wo[0][0].foldmethod = "expr"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.cmd.normal("zx")
			end)
		end
	end,
})

-- Set filetype-specific fold levels
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("self/filetype_foldlevel", { clear = true }),
	desc = "Set fold level based on filetype",
	callback = function(args)
		local foldlevels = {
			json = 2,
			yaml = 2,
			xml = 2,
		}
		local level = foldlevels[vim.bo.filetype] or 6 -- default to 6
		vim.opt_local.foldlevel = level

		-- Set buffer-local keybind to reset to this buffer's fold level
		vim.keymap.set("n", "<leader>W", function()
			vim.opt_local.foldlevel = level
		end, { buffer = args.buf, noremap = true, desc = "Reset to default fold level" })
	end,
})
