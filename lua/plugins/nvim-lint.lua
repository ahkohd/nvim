-- luacheck: globals vim

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local webdev_linters = { "biomejs", "eslint" }

		require("lint").linters_by_ft = {
			html = webdev_linters,
			css = webdev_linters,
			typescript = webdev_linters,
			typescriptreact = webdev_linters,
			javascript = webdev_linters,
			javascriptreact = webdev_linters,
			lua = { "luacheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
