return {

	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	config = function()
		local on_attach = require("core.utils.lsp").on_attach

		require("crates").setup({
			lsp = {
				enabled = true,
				on_attach,
				actions = true,
				completion = true,
				hover = true,
			},
		})
	end,
}
