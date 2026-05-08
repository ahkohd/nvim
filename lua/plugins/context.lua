return {
	"ahkohd/context.nvim",
	config = function()
		local context = require("context")
		local extras = require("context.extras")
		context.setup({
			picker = context.pickers.snacks,
			getters = {
				definition = extras.lsp.definition,
				references = extras.lsp.references,
			},
			prompts = {},
			lsp = {
				enabled = true,
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
	},
}
