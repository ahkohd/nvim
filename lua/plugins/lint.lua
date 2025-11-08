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

		local lua_linters = {}
		if linter_exists("luacheck") then
			local luacheck = lint.linters.luacheck
			-- Add vim to globals for luacheck to avoid undefined warnings
			luacheck.args = vim.list_extend({ "--globals", "vim" }, luacheck.args or {})
			lua_linters = { "luacheck" }
		else
			if not vim.g.nvim_lint_luacheck_notified then
				vim.g.nvim_lint_luacheck_notified = true
				vim.notify("luacheck not found. Install with: luarocks install luacheck", vim.log.levels.WARN)
			end
		end

		lint.linters_by_ft = {
			lua = lua_linters,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}
