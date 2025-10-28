-- luacheck: globals vim

return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			max_concurrent_installers = 12,
			PATH = "append",
		})

		-- Ensure LSP servers are installed
		local registry = require("mason-registry")
		local ensure_installed = {
			"lua-language-server",
			"rust-analyzer",
			"html-lsp",
			"json-lsp",
			"css-lsp",
			"tailwindcss-language-server",
			"taplo",
			"vim-language-server",
			"astro-language-server",
			"nixd",
			"zls",
			"vtsls",
      "marksman"
		}

		registry.refresh(function()
			for _, pkg_name in ipairs(ensure_installed) do
				local ok, pkg = pcall(registry.get_package, pkg_name)
				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end)

		-- List of LSP servers to enable
		local servers = {
			"html",
			"jsonls",
			"lua_ls",
			"cssls",
			"tailwindcss",
			"taplo",
			"astro",
			"nixd",
			"rust_analyzer",
			"zls",
      "vtsls",
      "marksman"
		}

		local utils = require("core.utils.lsp")

		-- Enable each server
		for _, name in ipairs(servers) do
			-- Check if the server config exists
			if vim.lsp.config[name] then
				-- Override capabilities
				vim.lsp.config[name].capabilities = utils.capabilities()

				-- Enable the LSP server
				vim.lsp.enable(name)
			else
				vim.notify("LSP config not found for: " .. name, vim.log.levels.WARN)
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				utils.on_attach(client, args.buf)
			end,
		})

		-- Create LspInfo command to show current LSP information in float
		vim.api.nvim_create_user_command("LspInfo", function()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local lines = {}

			if #clients == 0 then
				table.insert(lines, "No LSP clients attached to current buffer")
			else
				table.insert(lines, "Attached LSP clients:")
				table.insert(lines, "")
				for _, client in ipairs(clients) do
					local root = client.config.root_dir or "N/A"
					local filetypes = table.concat(client.config.filetypes or {}, ", ")
					table.insert(lines, string.format("  • %s", client.name))
					table.insert(lines, string.format("    Root: %s", root))
					table.insert(lines, string.format("    Filetypes: %s", filetypes))
					table.insert(lines, "")
				end
			end

			-- Create floating window
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.api.nvim_buf_set_option(buf, "modifiable", false)
			vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

			local width = 60
			local height = #lines
			local opts = {
				relative = "editor",
				width = width,
				height = height,
				col = (vim.o.columns - width) / 2,
				row = (vim.o.lines - height) / 2 - 2,
				style = "minimal",
				border = "rounded",
			}

			local win = vim.api.nvim_open_win(buf, true, opts)
			vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:FloatBorder")

			-- Close on escape or q
			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
			vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
		end, { desc = "Show LSP info in floating window" })

		local lsp_utils = require("core.utils.lsp")

		lsp_utils.setup_appearance()
	end,
}
