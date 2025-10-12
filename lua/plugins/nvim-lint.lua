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
			if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
				if linter_exists("biomejs") then
					table.insert(linters, "biomejs")
				else
					-- Notify about missing biomejs (only once per session)
					if not vim.g.nvim_lint_biomejs_notified then
						vim.g.nvim_lint_biomejs_notified = true
						vim.notify("biomejs not found but biome.json exists. Install with: npm i -D @biomejs/biome", vim.log.levels.WARN)
					end
				end
			end

			-- Add eslint if it exists
			if linter_exists("eslint") then
				table.insert(linters, "eslint")
			else
				-- Notify about missing eslint (only once per session)
				if not vim.g.nvim_lint_eslint_notified then
					vim.g.nvim_lint_eslint_notified = true
					vim.notify("eslint not found. Install globally or in node_modules/.bin/", vim.log.levels.WARN)
				end
			end

			return linters
		end

		local web = get_web_linter()
		local lua_linters = {}
		if linter_exists("luacheck") then
			lua_linters = { "luacheck" }
		else
			-- Notify about missing luacheck (only once per session)
			if not vim.g.nvim_lint_luacheck_notified then
				vim.g.nvim_lint_luacheck_notified = true
				vim.notify("luacheck not found. Install with: luarocks install luacheck", vim.log.levels.WARN)
			end
		end

		lint.linters_by_ft = {
			html = web,
			css = web,
			typescript = web,
			typescriptreact = web,
			javascript = web,
			javascriptreact = web,
			lua = lua_linters,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				-- Use ignore_errors to suppress any errors from missing binaries
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}
