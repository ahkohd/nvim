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
				classlist = [[Organize className attributes in React components at {position}. This applies to:
1. Long inline className strings (>80-100 characters)
2. Existing disorganized `cn()` or `classList()` calls

**Priority:**
1. Use `cn()` if already imported
2. Use `classList()` if `cn()` is unavailable

**Formatting:**
- Break into multiple lines
- Group semantically related classes together
- Common groupings (in order):
  - Layout & flexbox (flex, grid)
  - Spacing (gap, padding, margin)
  - Sizing (width, height, max-w)
  - Positioning (absolute, relative, z-index)
  - Display & visibility
  - Typography
  - Colors & backgrounds
  - Borders
  - Effects (shadow, opacity)
  - Overflow & scrolling
  - Transitions & animations
  - Responsive variants (keep with base class)

**Example:**

Before (inline):
  className="max-h-[50vh] md:max-h-auto flex-col gap-4 md:gap-2 pt-2 w-full md:max-w-56 overflow-y-auto scrollbar-hide"

Before (disorganized cn):
  className=cn('overflow-y-auto max-h-[50vh] w-full flex-col md:gap-2 gap-4 pt-2 md:max-w-56 scrollbar-hide md:max-h-auto')

After:
  className=cn(
    'flex-col gap-4 md:gap-2 pt-2',
    'w-full md:max-w-56',
    'max-h-[50vh] md:max-h-auto',
    'overflow-y-auto scrollbar-hide'
  )

Keep responsive modifiers with their base class (e.g., gap-4 md:gap-2). Each line should be scannable and not exceed ~80 characters.]],
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
