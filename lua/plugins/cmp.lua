-- luacheck: globals vim

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		if not vim.fn.exists("g:loaded_cmp") then
			return
		end

		vim.o.completeopt = "menuone,noinsert,noselect"

		local cmp = require("cmp")

		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end

			local line, col = unpack(vim.api.nvim_win_get_cursor(0))

			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-a>"] = cmp.mapping.complete(),
				["<C-n>"] = cmp.mapping.close(),
				["<C-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-j>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				["<C-k>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
			}),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua", keyword_length = 1 },
				{ name = "buffer", keyword_length = 2 },
				{ name = "calc" },
			}),
		})

		vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])

		require("cmp_luasnip")
	end,
}
