-- luacheck: globals vim

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Helper function to check if a linter executable exists
		local function linter_exists(name)
			local linter = lint.linters[name]
			if not linter then
				return false
			end

			local cmd = linter.cmd or name
			if type(cmd) == "function" then
				local ok, result = pcall(cmd)
				cmd = ok and result or name
			end

			return vim.fn.executable(cmd) == 1
		end

		local function get_web_linter()
			local root_dir = require("core.utils.project").root_dir()
			local biome_config_path = root_dir and (root_dir .. "/biome.json") or ""

			local linters = {}

			-- Check for biome config and if biome exists
			if root_dir and vim.fn.filereadable(biome_config_path) == 1 and linter_exists("biomejs") then
				table.insert(linters, "biomejs")
			end

			-- Add eslint if it exists
			if linter_exists("eslint") then
				table.insert(linters, "eslint")
			end

			return linters
		end

		local web = get_web_linter()
		local lua_linters = linter_exists("luacheck") and { "luacheck" } or {}

		lint.linters_by_ft = {
			html = web,
			css = web,
			typescript = web,
			typescriptreact = web,
			javascript = web,
			javascriptreact = web,
			lua = lua_linters,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				-- Use ignore_errors to suppress any errors from missing binaries
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}
