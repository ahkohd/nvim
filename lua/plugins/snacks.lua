--luacheck: globals vim Snacks

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
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
			"<leader>F",
			function()
				Snacks.explorer.open({
					auto_close = true,
					focus = "input",
					hidden = true,
					git = {
						ignore = true,
					},
					actions = {

						confirm_from_input = function(picker)
							local item = picker:current()
							if item then
								-- For directories, focus the list
								if item.dir then
									picker:focus("list")
								else
									-- For files, open them and close the picker
									picker:close()
									vim.cmd("edit " .. vim.fn.fnameescape(item.file or item._path))
								end
							end
						end,
					},
					win = {
						input = {
							keys = {
								["<cr>"] = { "confirm_from_input", mode = { "i", "n" }, desc = "Open file from input" },
							},
						},
					},
					layout = {
						layout = {
							box = "horizontal",
							backdrop = false,
							width = 0.8,
							height = 0.9,
							border = "none",
							{
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "Finder",
									title_pos = "center",
								},
								{ win = "list", title = "", title_pos = "center", border = "rounded" },
							},
						},
					},
				})
			end,
			desc = "File explorer",
		},
		{
			"<leader>r",
			function()
				Snacks.picker.grep({
					layout = "dropdown",
				})
			end,
			desc = "Search (live grep)",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Search buffers",
		},
		{
			"<leader>J",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Search jumplist",
		},
		{
			"<leader>m",
			function()
				Snacks.picker.marks()
			end,
			desc = "Search marks",
		},
		{
			"<leader>\\",
			function()
				Snacks.picker.help()
			end,
			desc = "Search helptags",
		},
		{
			"<leader>k",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Show code actions",
		},
		{
			"<leader>R",
			function()
				Snacks.picker.registers({
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
			desc = "Buffer lines",
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
				preset = "dropdown",
				preview = false,
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
}
