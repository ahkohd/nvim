-- luacheck: globals vim

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "CodeCompanion" },
	keys = {
		{ "<c-'>", "<cmd>CodeCompanionChat Toggle<CR>", desc = "AI Chat", mode = { "n", "i", "v", "t" } },
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", desc = "AI Chat" },
		{ "<leader>aC", "<cmd>CodeCompanionActions<CR>", desc = "AI Chat Actions" },
	},
	config = function()
		require("codecompanion").setup({
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						show_result_in_chat = true,
						make_vars = true,
						make_slash_commands = true,
					},
				},
			},
			display = {
				chat = {
					window = {
						layout = "vertical",
					},
				},
			},
			strategies = {
				chat = {
					adapter = "anthropic",
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
							api_key = "cmd:op read op://Personal/bsmb67eqywjp2f3qayupnh555u/credential --no-newline",
						},
					})
				end,
			},
		})

		require("core.ui.code-companion-fidget"):init()
	end,
}
