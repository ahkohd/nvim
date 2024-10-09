-- luacheck: globals vim

return {
	"neovim/nvim-lspconfig",
	name = "lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"mrcjkb/rustaceanvim",
			version = "^5",
			lazy = false,
		},
		-- neotest
		"nvim-neotest/neotest",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-vim-test",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"lawrence-laz/neotest-zig",
	},
	config = function()
		require("mason").setup({
			max_concurrent_installers = 12,
			PATH = "append",
		})

		vim.api.nvim_create_user_command("LspConfigShow", function()
			vim.notify(vim.inspect(vim.lsp.get_active_clients()))
		end, { desc = "Show LSP settings" })

		vim.api.nvim_create_user_command("LspConfigReload", function()
			vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
			vim.cmd.edit()
		end, { desc = "Reload LSP settings" })

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				spacing = 4,
				prefix = "",
			},
		})

		local lsp = require("lspconfig")

		local on_attach = require("core.utils.lsp").on_attach

		local server_configs = {
			vimls = {
				on_attach,
			},
			lua_ls = {
				on_attach,
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
			css_ls = {
				on_attach,
			},
			cssmodules_ls = {
				on_attach,
			},
			biome = {
				on_attach,
				-- disable LSP if biome.json is not found
				disabled = function()
					local root_dir = require("lspconfig.util").find_git_ancestor(vim.fn.getcwd())
					local biome_config_path = root_dir and (root_dir .. "/biome.json") or ""
					if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
						return false
					else
						return true
					end
				end,
			},
			tsserver = {
				on_attach,
			},
			rust_analyzer = {
				disabled = function()
					return true
				end,
			},
			zls = {
				on_attach,
			},
			marksman = {
				on_attach,
			},
		}

		require("mason-lspconfig").setup({
			ensure_installed = {
				"biome",
				"custom_elements_ls",
				"html",
				"jsonls",
				"lua_ls",
				"tailwindcss",
				"taplo",
				"ts_ls",
				"vimls",
				"astro",
				"mdx_analyzer",
				"zls",
				"marksman",
			},
		})

		require("mason-lspconfig").setup_handlers({
			function(name)
				local config = server_configs[name] or {}

				local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

				if ok then
					local orig = vim.lsp.protocol.make_client_capabilities()
					config.capabilities = cmp_nvim_lsp.default_capabilities(orig)
				end

				-- disable LSP if disabled() returns true
				if config.disabled and config.disabled() then
					return
				end

				lsp[name].setup(config)
			end,
		})

		-- configure rustaceanvim
		local rust_config = function()
			local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"
			local this_os = vim.loop.os_uname().sysname

			-- The path is different on Windows
			if this_os:find("Windows") then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				-- The liblldb extension is .so for Linux and .dylib for MacOS
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			local cfg = require("rustaceanvim.config")
			local lsp_utils = require("core.utils.lsp")

			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					on_attach = lsp_utils.on_attach,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = false,
						},
					},
				},
			}
		end

		vim.g.rustaceanvim = rust_config()

		-- configure DAP
		require("mason-nvim-dap").setup({
			ensure_installed = { "js", "codelldb" },
		})

		local js_dap_config = function()
			local dap = require("dap")

			local js_based_languages = { "typescript", "javascript", "typescriptreact" }

			local js_debug_adapter_path = require("mason-registry").get_package("js-debug-adapter"):get_install_path()

			dap.set_log_level("DEBUG")

			for _, adapter in ipairs({ "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }) do
				dap.adapters[adapter] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							js_debug_adapter_path .. "/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}
			end

			dap.adapters["pwa-chrome"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						js_debug_adapter_path .. "/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			for _, language in ipairs(js_based_languages) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						skipFiles = { "<node_internals>/**" },
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach Program (pwa-node, select pid)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						processId = require("dap.utils").pick_process,
						skipFiles = { "<node_internals>/**" },
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					{
						type = "pwa-chrome",
						request = "attach",
						name = "Attach Program (pwa-chrome, select port)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						protocol = "inspector",
						port = function()
							return vim.fn.input("Select port: ", 9222)
						end,
						webRoot = "${workspaceFolder}",
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Launch Chrome with "localhost"',
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input(
									{ prompt = "Enter URL: ", default = "http://localhost:5173" },
									function(url)
										if url == nil or url == "" then
											return
										else
											coroutine.resume(co, url)
										end
									end
								)
							end)
						end,
						webRoot = "${workspaceFolder}",
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
				}
			end
		end

		js_dap_config()

		require("neotest").setup({
			adapters = {
				require("neotest-vim-test")({
					ignore_file_types = { "python", "vim", "lua" },
				}),

				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},

			require("neotest-vitest"),

			require("rustaceanvim.neotest"),

			require("neotest-zig")({
				dap = {
					adapter = "codelldb",
				},
			}),
		})
	end,
}
