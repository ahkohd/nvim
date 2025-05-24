-- luacheck: globals vim

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	keys = {
		{
			"<leader>c",
			function()
				vim.cmd("Copilot toggle")
			end,
			desc = "Toggle Copilot",
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
