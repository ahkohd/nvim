-- luacheck: globals vim

return {
	"neovim/nvim-lspconfig",
	name = "lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason").setup({
			max_concurrent_installers = 12,
			PATH = "append",
		})

		local server_configs = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = require("core.utils.lsp").lua_globals },
						format = { enable = false },
						hint = { enable = true },
						telemetry = { enable = false },
						workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			},
			biome = {
				-- disable LSP if biome.json is not found
				disabled = function()
					local root_dir = require("core.utils.project").root_dir()
					local biome_config_path = root_dir and (root_dir .. "/biome.json") or ""
					if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
						return false
					else
						return true
					end
				end,
			},
			nixd = {
				nixpkgs = {
					expr = "import <nixpkgs> { }",
				},
				formatting = {
					command = { "nixfmt" },
				},
				options = {
					nixos = {
						expr = '(builtins.getFlake "/home/var/.dotfiles").nixosConfigurations.nixos.options',
					},
					home_manager = {
						expr = '(builtins.getFlake "/home/var/.dotfiles").homeConfigurations.nixos.options',
					},
				},
			},
		}

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"biome",
				"html",
				"jsonls",
				"lua_ls",
				"cssls",
				"cssmodules_ls",
				"tailwindcss",
				"taplo",
				"vimls",
				"astro",
				"zls",
				"marksman",
				"typos_lsp",
			},
			handlers = {
				function(server_name)
					local name = server_name

					-- this is a hack to use nixd, mason-lsp-config does
					-- not support nixd yet
					if name == "typos_lsp" then
						name = "nixd"
					end

					local config = server_configs[name] or {}

					-- disable LSP if disabled() returns true
					if config.disabled and config.disabled() then
						return
					end

					local utils = require("core.utils.lsp")

					config.on_attach = utils.on_attach

					config.capabilities = utils.capabilities()

					require("lspconfig")[name].setup(config)
				end,
			},
		})

		local lsp_utils = require("core.utils.lsp")

		lsp_utils.setup_appearance()
	end,
}
