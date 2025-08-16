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

		-- Helper function to check if a formatter exists
		local function formatter_exists(name)
			-- Handle special cases
			if name == "zig fmt" then
				return vim.fn.executable("zig") == 1
			elseif name == "trim_whitespace" then
				return true -- Built-in formatter
			end

			-- Check for project-local formatter in node_modules
			local root_dir = require("core.utils.project").root_dir()
			if root_dir then
				local local_path = root_dir .. "/node_modules/.bin/" .. name
				if vim.fn.executable(local_path) == 1 then
					return true
				end
			end

			-- Check for global formatter
			return vim.fn.executable(name) == 1
		end

		-- Function to filter available formatters
		local function get_available_formatters(formatters)
			return vim.tbl_filter(formatter_exists, formatters)
		end

		local web = get_available_formatters({ "biome", "prettier" })

		return {
			formatters = {},
			formatters_by_ft = {
				html = web,
				css = web,
				scss = web,
				javascript = web,
				typescript = web,
				javascriptreact = web,
				typescriptreact = web,
				markdown = web,
				toml = formatter_exists("taplo") and { "taplo" } or {},
				lua = formatter_exists("stylua") and { "stylua" } or {},
				nix = formatter_exists("nixfmt") and { "nixfmt" } or {},
				zig = formatter_exists("zig") and { "zig fmt" } or {},
				rust = formatter_exists("cargo") and { "rustfmt" } or {},
				["_"] = { "trim_whitespace" },
				["*"] = {},
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			notify_on_error = false, -- Suppress error notifications
		}
	end,
}
