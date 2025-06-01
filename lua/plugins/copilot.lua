-- luacheck: globals vim

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	keys = {
		{
			"<leader>as",
			function()
				vim.cmd("Copilot toggle")
			end,
			desc = "Toggle Copilot Suggestion",
		},
	},
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<c-l>",
				},
			},
		})
	end,
}
