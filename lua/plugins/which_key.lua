-- luacheck: globals vim

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			w = { "<cmd>w<cr>", "Save" },
			Q = {
				name = "+Quit",
				q = { "<cmd>qa!<cr>", "Quit Neovim" },
				b = {
					function()
						local bufs = vim.api.nvim_list_bufs()

						local current_buf = vim.api.nvim_get_current_buf()

						for _, i in ipairs(bufs) do
							if i ~= current_buf then
								vim.api.nvim_buf_delete(i, {})
							end
						end
					end,
					"Close other buffers",
				},
			},
			v = { "<cmd>Themery<cr>", "Quit" },
			s = {
				name = "Find and Replace",
			},
			d = {
				name = "Diagnostics",
			},
			g = { "<cmd>LazyGit<cr>", "LazyGit" },
			b = {
				name = "Debug",
			},
			t = {
				name = "Tests",
			},
			x = {
				name = "Sessions",
			},
			l = {
				name = "Pencil",
			},
			["."] = {
				function()
					vim.o.number = not vim.o.number

					vim.o.relativenumber = not vim.o.relativenumber
				end,
				"Toggle line number",
			},
			["<tab>"] = {
				function()
					vim.cmd([[tab split]])
				end,
				"Make buffer full-screen",
			},
		}, { prefix = "<space>" })
	end,
}
