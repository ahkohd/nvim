-- luacheck: globals vim

return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	config = function()
		require("mason").setup({
			max_concurrent_installers = 12,
			PATH = "append",
		})

		-- Ensure LSP servers are installed
		local registry = require("mason-registry")
		local ensure_installed = {
			"lua-language-server",
			"rust-analyzer",
			"biome",
			"html-lsp",
			"json-lsp",
			"css-lsp",
			"cssmodules-language-server",
			"tailwindcss-language-server",
			"taplo",
			"vim-language-server",
			"astro-language-server",
			"marksman",
			"nixd",
			"zls",
			"typescript-language-server",
			"eslint-lsp",
		}

		registry.refresh(function()
			for _, pkg_name in ipairs(ensure_installed) do
				local ok, pkg = pcall(registry.get_package, pkg_name)
				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end)

		-- List of LSP servers to enable
		local servers = {
			"biome",
			"html",
			"jsonls",
			"lua_ls",
			"cssls",
			"cssmodules_ls",
			"tailwindcss",
			"taplo",
			"astro",
			"marksman",
			"nixd",
			"rust_analyzer",
			"zls",
			"ts_ls",
		}

		local utils = require("core.utils.lsp")

		-- Enable each server
		for _, name in ipairs(servers) do
			-- Check if the server config exists
			if vim.lsp.config[name] then
				-- Override on_attach and capabilities
				vim.lsp.config[name].on_attach = utils.on_attach
				vim.lsp.config[name].capabilities = utils.capabilities()

				-- Enable the LSP server
				vim.lsp.enable(name)
			else
				vim.notify("LSP config not found for: " .. name, vim.log.levels.WARN)
			end
		end

		local lsp_utils = require("core.utils.lsp")

		lsp_utils.setup_appearance()
	end,
}
