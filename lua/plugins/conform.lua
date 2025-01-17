-- luacheck: globals vim

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "Format",
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

		local webdev_formatters = { "biome", "prettier" }

		return {
			formatters_by_ft = {
				html = webdev_formatters,
				scss = webdev_formatters,
				css = webdev_formatters,
				javascript = webdev_formatters,
				typescript = webdev_formatters,
				javascriptreact = webdev_formatters,
				typescriptreact = webdev_formatters,
				markdown = webdev_formatters,
				toml = { "taplo" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				zig = { "zig fmt" },
				["_"] = { "trim_whitespace" },
				["*"] = {},
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		}
	end,
}
