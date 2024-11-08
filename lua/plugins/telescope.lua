-- luacheck: globals vim

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
					previewer = true,
				})
			end,
			desc = "Search buffers",
		},
		{ "<space>\\", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{
			"<space>m",
			function()
				vim.cmd("Telescope marks")
			end,
			desc = "Toggle marks",
		},
		{
			"<space>p",
			function()
				local action_layout = require("telescope.actions.layout")

				require("telescope").extensions.neoclip.neoclip(require("telescope.themes").get_dropdown({
					initial_mode = "normal",
					mappings = {
						n = {
							["p"] = action_layout.toggle_preview,
						},
					},
				}))
			end,
			desc = "Toggle yank list",
		},
		{
			"<space>n",
			function()
				local action_layout = require("telescope.actions.layout")

				require("telescope").extensions.noice.noice(require("telescope.themes").get_dropdown({
					initial_mode = "normal",
					previewer = false,
					mappings = {
						n = {
							["p"] = action_layout.toggle_preview,
						},
					},
				}))
			end,
			desc = "Toggle notifications",
		},
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

		telescope.load_extension("neoclip")

		telescope.load_extension("noice")

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
							["d"] = actions.delete_buffer,
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
