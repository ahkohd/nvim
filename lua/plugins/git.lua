-- luacheck: globals Snacks

return {
	"trevorhauter/gitportal.nvim",
	event = "VeryLazy",
	deps = {
		{
			dir = "~/.config/nvim/lua/dev/git-blame",
			config = function()
				require("git-blame").setup()
			end,
		},
	},
	keys = {
		{
			"<leader>go",
			function()
				require("gitportal").open_file_in_browser()
			end,
			desc = "Open file in browser",
		},
		{
			"<leader>gc",
			function()
				require("gitportal").copy_link_to_clipboard()
			end,
			desc = "Copy link to clipboard",
		},
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
	},
	opts = { always_include_current_line = true },
}
