--luacheck: globals vim Snacks

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		{
			"madmaxieee/fff-snacks.nvim",
			cmd = "FFFSnacks",
			config = true,
		},
	},
	keys = {
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		-- pickers
		{
			"<leader>f",
			"<cmd>FFFSnacks<cr>",
			desc = "Files",
		},
		{
			"<leader>r",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.buffers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>J",
			function()
				Snacks.picker.jumps({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Jumplist",
		},
		{
			"<leader>m",
			function()
				Snacks.picker.marks({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Marks",
		},
		{
			"<leader>M",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Page",
		},
		{
			"<leader>qo",
			function()
				Snacks.picker.qflist({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Quickfix",
		},
		{
			"<leader>lo",
			function()
				Snacks.picker.loclist({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Locations",
		},
		{
			"<leader>\\",
			function()
				Snacks.picker.help()
			end,
			desc = "Helptags",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gR",
			function()
				vim.lsp.buf.rename()
			end,
			desc = "Rename symbol",
		},
		{
			"gfr",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename file",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Goto Type Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>k",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Code actions",
		},
		{
			"<leader>R",
			function()
				Snacks.picker.registers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
					actions = {
						copy_silent = function(picker, item)
							if item and item.text then
								vim.fn.setreg('"', item.text)
								picker:close()
							end
						end,
					},
					confirm = "copy_silent",
				})
			end,
			desc = "Registers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "Lines",
		},
		{
			"<leader>?",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
	},
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
		input = { enabled = true },
		picker = {
			layout = {
				preset = "ivy_taller",
			},
			win = {
				input = {
					keys = {
						["s"] = { "flash" },
					},
				},
			},
			actions = {
				flash = function(picker)
					require("flash").jump({
						pattern = "^",
						label = { after = { 0, 0 } },
						search = {
							mode = "search",
							exclude = {
								function(win)
									return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
								end,
							},
						},
						action = function(match)
							local idx = picker.list:row2idx(match.pos[1])
							picker.list:_move(idx, true, true)
						end,
					})
				end,
			},
		},
	},
	init = function()
		local layouts = require("snacks.picker.config.layouts")
		layouts.ivy_taller = vim.tbl_deep_extend("keep", { layout = { height = 0.8 } }, layouts.ivy)
	end,
}
