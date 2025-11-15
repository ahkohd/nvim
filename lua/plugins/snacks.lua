-- luacheck: globals Snacks

local buffer_utils = require("core.utils.buffer")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		{
			"ahkohd/fff-snacks.nvim",
			cmd = "FFFSnacks",
			opts = {
				title = "Files",
			},
		},
	},
	keys = {
		{
			"]]",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		-- pickers
		{
			"<leader>f",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				vim.cmd("FFFSnacks")
			end,
			desc = "Files",
		},
		{
			"<leader>r",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				Snacks.picker.grep({ title = "Search" })
			end,
			desc = "Grep",
		},
		{
			"<leader>J",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
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
				if buffer_utils.in_special_buffer() then
					return
				end
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
			"<leader>lo",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
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
			"<leader><esc>",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				Snacks.picker.help({ title = "Help" })
			end,
			desc = "Helptags",
		},
		-- LSP
		{
			"gd",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
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
				if buffer_utils.in_special_buffer() then
					return
				end
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
				if buffer_utils.in_special_buffer() then
					return
				end
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
				if buffer_utils.in_special_buffer() then
					return
				end
				vim.lsp.buf.rename()
			end,
			desc = "Rename symbol",
		},
		{
			"gfr",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				Snacks.rename.rename_file()
			end,
			desc = "Rename file",
		},
		{
			"gI",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
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
				if buffer_utils.in_special_buffer() then
					return
				end
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
			"<leader>p",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>y",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				local items = {}
				-- Register 0 contains the most recent yank
				-- Registers 1-9 contain delete history (but also yanks sometimes)
				for i = 0, 9 do
					local reg_content = vim.fn.getreg(tostring(i))
					if reg_content and reg_content ~= "" then
						local preview = reg_content:gsub("\n", " "):sub(1, 80)
						table.insert(items, {
							text = string.format("[%d] %s", i, preview),
							register = tostring(i),
							content = reg_content,
						})
					end
				end

				Snacks.picker.pick({
					title = "Yank",
					items = items,
					format = "text",
					preview = function(ctx)
						if ctx.item and ctx.item.content then
							local lines = vim.split(ctx.item.content, "\n", { plain = true })
							ctx.preview:set_lines(lines)
						end
					end,
					on_show = function()
						vim.cmd.stopinsert()
					end,
					actions = {
						paste = function(picker, item)
							if item and item.content then
								vim.fn.setreg('"', item.content)
								picker:close()
								vim.schedule(function()
									vim.cmd('normal! ""p')
								end)
							end
						end,
						copy = function(picker, item)
							if item and item.content then
								vim.fn.setreg('"', item.content)
								picker:close()
							end
						end,
					},
					confirm = "copy",
				})
			end,
			desc = "Yank History",
		},
		{
			"<leader>?",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
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
		gh = {},
		picker = {
			layout = {
				preset = "ivy_taller_clean",
			},
			prompt = " ",
			icons = {
				files = {
					enabled = false,
				},
			},
			sources = {
				explorer = {
					git_status = false,
					diagnostics = false,
					formatters = {
						file = {
							git_status_hl = false,
						},
					},
					icons = {
						files = {
							enabled = false,
						},
						git = {
							enabled = false,
						},
					},
					layout = {
						layout = {
							width = 30,
							min_width = 30,
							position = "left",
							border = "none",
							backdrop = false,
						},
					},
				},
				gh_issue = {},
				gh_pr = {},
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
		layouts.ivy_taller = vim.tbl_deep_extend("keep", { layout = { height = 0.8, title = "{title}" } }, layouts.ivy)
		layouts.ivy_taller_clean = vim.tbl_deep_extend("keep", {
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.8,
				border = "none",
				title = " {title} {live} {flags}",
				title_pos = "left",
				{ win = "input", height = 1, border = "none" },
				{
					box = "horizontal",
					{ win = "list", border = "rounded" },
					{ win = "preview", title = "{preview}", width = 0.6, border = "rounded" },
				},
			},
		}, layouts.ivy)
	end,
}
