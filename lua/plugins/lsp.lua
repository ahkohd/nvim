return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local ensure_installed = {
			-- lua
			"lua-language-server",
			"luacheck",
			"stylua",
			-- webdev
			"html-lsp",
			"json-lsp",
			"css-lsp",
			-- markup
			"marksman",
			"taplo",
			-- typescript
			"vtsls",
			"eslint-lsp",
			-- rust
			"rust-analyzer",
			-- nix
			"nixd",
		}

		local enabled_servers = {
			"html",
			"jsonls",
			"lua_ls",
			"cssls",
			"tailwindcss",
			"taplo",
			"nixd",
			"rust_analyzer",
			"vtsls",
			"marksman",
			"eslint",
		}

		require("mason").setup({
			max_concurrent_installers = 12,
			PATH = "append",
		})

		local registry = require("mason-registry")

		registry.refresh(function()
			for _, pkg_name in ipairs(ensure_installed) do
				local ok, pkg = pcall(registry.get_package, pkg_name)
				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end)

		local lsp_utils = require("core.utils.lsp")

		for _, name in ipairs(enabled_servers) do
			if vim.lsp.config[name] then
				vim.lsp.config[name].capabilities =
					vim.tbl_deep_extend("force", vim.lsp.config[name].capabilities or {}, lsp_utils.capabilities())
				vim.lsp.enable(name)
			else
				vim.notify("LSP config not found for: " .. name, vim.log.levels.WARN)
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				lsp_utils.on_attach(client, args.buf)
			end,
		})

		lsp_utils.setup_appearance()

		-- Extend LSP servers configurations
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					workspace = {
						-- Make Neovim runtime files available to lua_ls for completions and diagnostics
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})

		vim.lsp.config("vtsls", {
			settings = {
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "all" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
				},
				javascript = {
					inlayHints = {
						parameterNames = { enabled = "all" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
				},
			},
		})
	end,
}
