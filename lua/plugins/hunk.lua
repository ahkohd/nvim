return {
	"julienvincent/hunk.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	cmd = { "DiffEditor" },
	config = function()
		require("hunk").setup({
			keys = {
				global = {
					quit = { "q" },
					accept = { "<localleader><Cr>" },
					focus_tree = { "<localleader>e" },
				},

				tree = {
					expand_node = { "l", "<Right>" },
					collapse_node = { "h", "<Left>" },

					open_file = { "<Cr>" },

					toggle_file = { "a" },
				},

				diff = {
					toggle_line = { "a" },
					toggle_hunk = { "A" },
				},
			},

			ui = {
				tree = {
					-- Mode can either be `nested` or `flat`
					mode = "nested",
					width = 35,
				},
				--- Can be either `vertical` or `horizontal`
				layout = "vertical",
			},

			icons = {
				selected = "",
				deselected = "",
				partially_selected = "",

				folder_open = "",
				folder_closed = "",
			},

			-- Called right after each window and buffer are created.
			hooks = {
				---@param _context { buf: number, tree: NuiTree, opts: table }
				on_tree_mount = function(_context) end,
				---@param _context { buf: number, win: number }
				on_diff_mount = function(_context) end,
			},
		})
	end,
}
