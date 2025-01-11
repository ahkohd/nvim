-- luacheck: globals vim

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		function pick_webdev_linter()
			local root_dir = require("core.utils.project").root_dir()
			local biome_config_path = root_dir and (root_dir .. "/biome.json") or ""

			if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
				return { "biomejs" }
			end

			return { "eslint" }
		end

		local webdev_linter = pick_webdev_linter()

		require("lint").linters_by_ft = {
			html = webdev_linter,
			css = webdev_linter,
			typescript = webdev_linter,
			typescriptreact = webdev_linter,
			javascript = webdev_linter,
			javascriptreact = webdev_linter,
			lua = { "luacheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
