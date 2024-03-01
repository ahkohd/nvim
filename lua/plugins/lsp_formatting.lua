-- luacheck: globals vim

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = function()
		local function pick_web_formatter()
			local cwd = require("core.utils.project").root_file({ "biome.json" })

			if cwd then
				return { "biome" }
			end

			return { "prettierd", "prettier" }
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
				html = pick_web_formatter(),
				scss = pick_web_formatter(),
				css = pick_web_formatter(),
				javascript = pick_web_formatter(),
				typescript = pick_web_formatter(),
				javascriptreact = pick_web_formatter(),
				typescriptreact = pick_web_formatter(),
				markdown = pick_web_formatter(),
				yaml = { "yamlfmt" },
				toml = { "taplo" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				["*"] = {},
				["_"] = { "trim_whitespace" },
			},
			format_on_save = function(bufnr)
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end

				return { timeout_ms = 1000, lsp_fallback = true }
			end,
		}
	end,
}
