--luacheck: globals vim

return {
	"folke/sidekick.nvim",
	opts = {
    nes = {
      enabled = false,
    },
		cli = {
			tools = {
				claude = { cmd = { "sh", "-c", 'claude --continue "$@" 2>/dev/null || claude "$@"', "sh" }, url = "https://github.com/anthropics/claude-code" },
			},
			win = {
				layout = "float",
				float = {
					width = 1.0,
					height = 0.8,
					border = "rounded",
					row = 1.0,
				},
				keys = {
					-- hide from terminal mode
					hide_t = { ";a", "hide" },
				},
			},
			prompts = {
				commit = [[Describe the current change with `jj diff` for a commit message using `jj desc -m`.
Be concise and follow conventional commit format.
If the commit is immutable (error: 'Commit is immutable'), confirm with the user whether to run
`jj desc -m` again with the `--ignore-immutable` flag.]],
			},
		},
	},
	keys = {
		{
			";a",
			function()
				-- Hide current floating terminal before toggling CLI
				if _G.FloatTerminal then
					_G.FloatTerminal.hide_current_terminal()
				end
				require("sidekick.cli").toggle({ name = "claude", focus = true })
			end,
			desc = "Sidekick Claude Toggle",
			mode = { "n", "v" },
		},
		{
			";p",
			function()
				require("sidekick.cli").prompt()
			end,
			desc = "Sidekick Ask Prompt",
			mode = { "n", "v" },
		},
	},
}
