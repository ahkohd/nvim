return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "CodeCompanionChat", "CodeCompanion", "CodeCompanionActions", "CodeCompanionCmd" },
	keys = {
		{ "<leader>a", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Open CodeCompanion chat" },
		{ "<leader>A", "<cmd>CodeCompanionActions<CR>", desc = "Open CodeCompanion Actions" },
	},
	config = {
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "anthropic",
			},
		},
		adapters = {
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = {
						api_key = "cmd:op read op://Personal/bsmb67eqywjp2f3qayupnh555u/credential --no-newline",
					},
				})
			end,
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "cmd:op read op://Personal/bsmb67eqywjp2f3qayupnh555u/credential --no-newline",
					},
				})
			end,
		},
	},
}
