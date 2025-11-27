local web = { "prettier" }

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "Format",
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format buffer",
		},
		{
			"<leader>ll",
			function()
				if vim.fn.filereadable("package.json") ~= 1 then
					require("conform").format({ lsp_format = "fallback" })
					return
				end
				local pm = vim.fn.executable("yarn") == 1 and "yarn"
					or vim.fn.executable("pnpm") == 1 and "pnpm"
					or vim.fn.executable("npm") == 1 and "npm run"
				if pm then
					vim.cmd("!" .. pm .. " lint --fix --quiet")
				else
					vim.notify("No package manager found", vim.log.levels.WARN)
				end
			end,
			desc = "Lint (fix)",
		},
	},
	opts = function()
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, timeout_ms = 1000, lsp_format = "fallback", range = range })
		end, { range = true })

		return {
			formatters_by_ft = {
				html = web,
				css = web,
				scss = web,
				javascript = web,
				typescript = web,
				javascriptreact = web,
				typescriptreact = web,
				toml = { "taplo" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				zig = { "zig fmt" },
				rust = { "rustfmt" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			notify_on_error = false,
		}
	end,
}
