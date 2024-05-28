-- luacheck: globals vim

return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<space>f",
			"<cmd>lua require('telescope.builtin').find_files()<cr>",
			desc = "Find files",
		},
		{ "<space>r", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
		{
			"<space>ml",
			"<cmd>lua require('telescope.builtin').marks({mark_type = 'local'})<cr>",
			desc = "Search local marks",
		},
		{
			"<space>mg",
			"<cmd>lua require('telescope.builtin').marks({mark_type = 'global'})<cr>",
			desc = "Search global marks",
		},
		{
			"<space>ma",
			"<cmd>lua require('telescope.builtin').marks({mark_type = 'all'})<cr>",
			desc = "Search all marks",
		},
		{ "<space>j", "<cmd>lua require('telescope.builtin').jumplist()<cr>", desc = "Search jumplist" },
		{ "<space>\\", "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
		{ "<space><space>", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"ThePrimeagen/harpoon",
	},
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.load_extension("ui-select")
		telescope.load_extension("neoclip")
		telescope.load_extension("harpoon")

		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
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
