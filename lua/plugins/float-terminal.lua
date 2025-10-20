-- luacheck: globals vim

return {
	dir = "~/.config/nvim/lua/dev/float-terminal",
	cmd = "FloatTerminal",
	keys = {
		{
			";j",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(1)
				end
			end,
			desc = "Toggle terminal",
			mode = { "n", "t" },
		},
		{
			";c",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(2)
				end
			end,
			desc = "Toggle Coderabbit",
			mode = { "n", "t" },
		},
		{
			";f",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(3)
				end
			end,
			desc = "Toggle Yazi",
			mode = "n",
		},
	{
		";d",
		function()
			if _G.FloatTerminal then
				_G.FloatTerminal.toggle_terminal(4)
			end
		end,
		desc = "Toggle Git Diff",
			mode = { "n", "t" },
		},
		{
			";t",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(5)
				end
			end,
			desc = "Toggle Btop",
			mode = { "n", "t" },
		},
		{
			";<esc>",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.hide_current_terminal()
				end
			end,
			desc = "Hide terminal",
			mode = { "n", "t" },
		},
		{
			";q",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.hide_current_terminal()
				end
			end,
			desc = "Hide terminal",
			mode = { "n", "t" },
		},
	},
	config = function()
		require("float-terminal").setup({
			layout = "ivy_taller",
			terminals = {
				{ id = 1, cmd = "zsh", title = " Terminal " },
				{ id = 2, cmd = "crab", title = " CodeRabbit " },
				{ id = 3, cmd = "yazi", title = " Yazi " },
				{ id = 4, cmd = "jj diff", title = " Diff " },
				{ id = 5, cmd = "btop", title = " Btop " },
			},
		})
	end,
}
