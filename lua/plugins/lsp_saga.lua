-- luacheck: globals vim

return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				enable = false,
			},
		})

		local function lspSymbol(name, icon)
			local hl = "DiagnosticSign" .. name

			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		lspSymbol("Error", "")

		lspSymbol("Hint", "")

		lspSymbol("Info", "")

		lspSymbol("Warn", "")
	end,
}
