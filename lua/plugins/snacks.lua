--luacheck: globals vim Snacks

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		{
			"ahkohd/fff-snacks.nvim",
			cmd = "FFFSnacks",
			opts = {
        title = "Files"
      },
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
				Snacks.picker.grep({ title = "Search" })
			end,
			desc = "Grep",
		},
		{
			"<leader>J",
			function()
				Snacks.picker.jumps({
					title = "Jumplist",
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
					title = "Marks",
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Marks",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.man({ title = "Man Pages" })
			end,
			desc = "Man Page",
		},
		{
			"<leader>qo",
			function()
				Snacks.picker.qflist({
					title = "Quickfix",
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
					title = "Location List",
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
				Snacks.picker.help({ title = "Help" })
			end,
			desc = "Helptags",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions({
					title = "Definitions",
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
					title = "Declarations",
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
					title = "References",
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
					title = "Implementations",
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
					title = "Type Definitions",
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Goto Type Definition",
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
					title = "Registers",
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
				Snacks.picker.lines({ title = "Lines" })
			end,
			desc = "Lines",
		},
		{
			"<leader>?",
			function()
				Snacks.picker.keymaps({ title = "Keymaps" })
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
