-- luacheck: globals vim

return {
	"zaldih/themery.nvim",
	dependencies = {
		"lunacookies/vim-colors-xcode",
	},
	lazy = false,
	priority = 1000,
	config = function()
		-- xcodedark configuration options
		vim.g.xcodedark_green_comments = 1
		vim.g.xcodedark_match_paren_style = 1

		require("themery").setup({
			themes = {
				{
					name = "xcode-dark",
					colorscheme = "xcodedark",
				},
				{
					name = "xcode-light",
					colorscheme = "xcodelight",
				},
			},
		})

		require("theme")

		-- xcode lsp saga fix
		vim.api.nvim_set_hl(0, "SagaNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "SagaBorder", { link = "Normal" })

		-- xcode which key fix
		vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Pmenu" })
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "Pmenu" })
	end,
}
