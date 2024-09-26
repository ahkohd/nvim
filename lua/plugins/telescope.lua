return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<space>f",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<space>r",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<space>m",
			function()
				require("telescope.builtin").mark({ mark_type = "all" })
			end,
			desc = "Search all marks",
		},
		{
			"<space>j",
			function()
				require("telescope.builtin").jumplist({
					initial_mode = "normal",
				})
			end,
			desc = "Search jumplist",
		},
		{
			"<space><space>",
			function()
				require("telescope.builtin").buffers({
					sort_mru = true,
					sort_lastused = true,
					initial_mode = "normal",
				})
			end,
			desc = "Search buffers",
		},
		{ "<space>\\", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")

		telescope.load_extension("ui-select")
		telescope.load_extension("neoclip")

		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
					mappings = {
						n = {
							["p"] = action_layout.toggle_preview,
						},
					},
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					mappings = {
						n = {
							["d"] = actions.delete_buffer + actions.move_to_top,
							["p"] = action_layout.toggle_preview,
						},
					},
				},
			},
			defaults = {
				sorting_strategy = "descending",
				file_ignore_patterns = {
					".git/.*",
					"node_modules/.*",
					"vendor/.*",
					".next/.*",
					"target/debug/.*",
					"target/release/.*",
					"src-tauri/target/.*",
					"**/dist/**",
					"*.min.js",
				},
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				initial_mode = "insert",
				path_display = { "truncate" },
				winblend = 0,
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" },
			},
		})
	end,
}
