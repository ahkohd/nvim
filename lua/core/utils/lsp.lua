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

		-- extra capabilities for nvim-cmp
		local isCmpOk, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if isCmpOk then
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		end

		-- extra capabilities for blink-cmp
		local isBlinkOk, blink = pcall(require, "blink.cmp")
		if isBlinkOk then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		return capabilities
	end,
}

return M
