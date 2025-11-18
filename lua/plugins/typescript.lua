return {
	"dmmulroy/ts-error-translator.nvim",
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	opts = {
		auto_attach = true,
		servers = {
			"vtsls",
			"ts_ls",
		},
	},
}
