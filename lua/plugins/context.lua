return {
	dir = "~/Developer/context.nvim/",
	config = function()
		local context = require("context")
		context.setup({
			picker = context.pickers.snacks,
			-- picker = context.pickers.telescope,
			-- picker = context.pickers.fzf_lua,
			-- picker = context.pickers.vim_ui,
			-- on_select = function(item)
			-- 	vim.fn.setreg("+", item.value)
			-- end,
			prompts = {
				-- explain = "Explain {this}",
				-- fix = "Fix the issue at {position}",
				-- review = "Review {file} for issues",
				yourchanges = "Review recent git changes for: logic errors, edge cases, "
					.. "performance issues, readability problems, missing error handling. "
					.. "Be specific with line numbers and actionable fixes.",
				commit = "Describe the current change with `jj diff` for a commit message "
					.. "using `jj desc -m`. Be concise and follow conventional commit format. "
					.. "If the commit is immutable (error: 'Commit is immutable'), confirm "
					.. "with the user whether to run `jj desc -m` with `--ignore-immutable`.",
				classlist = "Organize className attributes in React components at {position}. "
					.. "For long inline className strings or disorganized cn()/classList() calls: "
					.. "use cn() if imported, else classList(). Break into multiple lines, group "
					.. "semantically (layout/flexbox, spacing, sizing, positioning, display, "
					.. "typography, colors, borders, effects, overflow, transitions). "
					.. "Keep responsive modifiers with base class.",
			},
		})
	end,
	keys = {
		{
			"<leader>a",
			function()
				require("context").pick()
			end,
			desc = "Context",
			mode = { "n", "v" },
		},
		{
			";p",
			function()
				require("context").pick(function(item)
					if item and item.value then
						if not _G.FloatTerminal then
							require("lazy").load({ plugins = { "float-terminal" } })
						end
						_G.FloatTerminal.send_to_terminal(6, item.value .. " ")
					end
				end)
			end,
			desc = "Context to Claude",
			mode = { "n", "v" },
		},
	},
}
