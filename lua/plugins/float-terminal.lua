return {
	dir = "~/.config/nvim/lua/dev/float-terminal",
	cmd = "FloatTerminal",
	keys = {
		{
			";r",
			function()
				if _G.FloatTerminal then
					_G.FloatTerminal.toggle_terminal(2)
				end
			end,
			desc = "Toggle Task Runner",
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
				{ id = 2, cmd = "mprocs", title = " Task Runner ", layout = { type = "fullscreen", border = "none" } },
				{ id = 3, cmd = "yazi", title = " Yazi ", layout = { type = "fullscreen", border = "none" } },
			},
		})
	end,
}
