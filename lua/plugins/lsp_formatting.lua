-- luacheck: globals vim

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = function()
		local function web_formatter()
			local cwd = require("core.utils.project").root_file({ "biome.json" })

			if cwd then
				return { "biome" }
			end

			return { "prettier" }
		end

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		return {
			formatters_by_ft = {
				html = web_formatter(),
				scss = web_formatter(),
				css = web_formatter(),
				javascript = web_formatter(),
				typescript = web_formatter(),
				javascriptreact = web_formatter(),
				typescriptreact = web_formatter(),
				markdown = web_formatter(),
				toml = { "taplo" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				zig = { "zig fmt" },
				["*"] = {},
				["_"] = { "trim_whitespace" },
			},
			format_on_save = function(bufnr)
				-- disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)

				if bufname:match("/node_modules/") then
					return
				end

				return { timeout_ms = 1000, lsp_fallback = true }
			end,
		}
	end,
}
