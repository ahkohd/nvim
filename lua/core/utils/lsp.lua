-- luacheck: globals vim

local lua_globals = {
	"vim",
	"packer_plugins",
	"api",
	"fn",
	"loop",
}

local M = {
	lua_globals = lua_globals,

	on_attach = function(_, buf)
		vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end,

	capabilities = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem = {
			snippetSupport = true,
		}

		-- extra capabilities for blink-cmp
		local isBlinkOk, blink = pcall(require, "blink.cmp")
		if isBlinkOk then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		return capabilities
	end,

	setup_appearance = function()
		for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
			vim.fn.sign_define("DiagnosticSign" .. diag, {
				text = "",
				texthl = "DiagnosticSign" .. diag,
				linehl = "",
				numhl = "DiagnosticSign" .. diag,
			})
		end
	end,
}

return M
