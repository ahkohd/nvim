return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
		},
		current_line_blame_formatter = "  <author>, <author_time:%b. %d/%y> • <summary>",
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				gs.nav_hunk("next")
			end, { desc = "Next hunk" })
			map("n", "[h", function()
				gs.nav_hunk("prev")
			end, { desc = "Prev hunk" })

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
			map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage hunk" })
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset hunk" })
			map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
			map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
			map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
			map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
			map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, { desc = "Diff this (~)" })
		end,
	},
}
