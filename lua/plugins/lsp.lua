return {
	{
		"mason-org/mason.nvim",
		opts = {
			max_concurrent_installers = 12,
			PATH = "append",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lsp_utils = require("core.utils.lsp")

			vim.lsp.config("*", {
				capabilities = lsp_utils.capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			local ts_inlay_hints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			}

			vim.lsp.config("vtsls", {
				settings = {
					typescript = { inlayHints = ts_inlay_hints },
					javascript = { inlayHints = ts_inlay_hints },
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
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
				},
				automatic_enable = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					lsp_utils.on_attach(client, args.buf)
				end,
			})

			lsp_utils.setup_appearance()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"luacheck",
				"stylua",
				"prettier",
			},
			run_on_start = true,
		},
	},
}
