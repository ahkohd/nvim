-- luacheck: globals vim

return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	keys = {
		{
			"<leader>rf",
			function()
				vim.cmd("!cargo fmt")
				vim.cmd("e!")
			end,
			desc = "Format",
		},
		{
			"<leader>rk",
			function()
				vim.cmd.RustLsp("flyCheck")
			end,
			desc = "Run check",
		},
		{
			"<leader>rK",
			function()
				vim.cmd.RustLsp("flyCheck", "clear")
			end,
			desc = "Clear check",
		},
		{
			"<leader>rx",
			function()
				vim.cmd.RustLsp("flyCheck", "cancel")
			end,
			desc = "Cancel check",
		},
		{
			"<leader>rme",
			function()
				vim.cmd.RustLsp("expandMacro")
			end,
			desc = "Expand macro",
		},
		{
			"<leader>rmr",
			function()
				vim.cmd.RustLsp("rebuildProcMacros")
			end,
			desc = "Rebuild proc macros",
		},
		{
			"<leader>ie",
			function()
				vim.cmd.RustLsp("explainError", "current")
			end,
			desc = "Explain error",
		},
		{
			"<leader>ioc",
			function()
				vim.cmd.RustLsp("openCargo")
			end,
			desc = "Open Cargo.toml",
		},
		{
			"<leader>iod",
			function()
				vim.cmd.RustLsp("openDocs")
			end,
			desc = "Open docs for symbol under cursor",
		},
	},
	init = function()
		local config = function()
			local lsp_utils = require("core.utils.lsp")

			return {
				tools = {
					enable_clippy = true,
					reload_workspace_from_cargo_toml = true,
					hover_actions = {
						replace_builtin_hover = false,
					},
				},
				server = {
					on_attach = lsp_utils.on_attach,
					default_settings = {
						["rust-analyzer"] = {
							checkOnSave = true,
							diagnostics = {
								disabled = { "unresolved-proc-macro" },
							},
						},
					},
				},
			}
		end

		vim.g.rustaceanvim = config()
	end,
}
