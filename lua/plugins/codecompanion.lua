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
		display = {
			chat = {
				window = {
					layout = "horizontal",
					position = "bottom",
				},
			},
		},
		strategies = {
			chat = {
				adapter = "openai",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "openai",
			},
		},
		adapters = {
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = {
						api_key = "cmd:op read op://Personal/OpenAiApi/credential --no-newline",
					},
				})
			end,
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "cmd:op read op://Personal/OpenAiApi/credential --no-newline",
					},
				})
			end,
		},
	},
}
