-- luacheck: globals vim

return {
	"saghen/blink.cmp",
	event = { "LspAttach", "InsertCharPre" },
	dependencies = "rafamadriz/friendly-snippets",
	build = "cargo build --release",
	opts = {
		highlight = {
			use_nvim_cmp_as_default = true,
		},

		nerd_font_variant = "mono",

		-- experimental auto-brackets support
		accept = { auto_brackets = { enabled = true } },

		-- experimental signature help support
		trigger = {
			completion = {
				keyword_range = "full",
			},
			signature_help = { enabled = true },
		},

		keymap = {
			show = "<c-a>",
			hide = "<c-n>",
			accept = "<c-y>",
			select_next = "<c-j>",
			select_prev = "<c-k>",
			scroll_documentation_down = "<c-d>",
			scroll_documentation_up = "<c-u>",
		},

		windows = {
			documentation = {
				min_width = 15,
				max_width = 50,
				max_height = 15,
				auto_show = true,
				auto_show_delay_ms = 0,
				direction_priority = {
					autocomplete_north = { "e", "w" },
					autocomplete_south = { "e", "w", "s" },
				},
			},
			autocomplete = {
				cycle = { from_top = false },
				draw = function(ctx)
					-- see: https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/blink-cmp.lua

					-- differentiate snippets from LSPs, the user, and emmet
					local icon, source = ctx.kind_icon, ctx.item.source
					local client = source == "LSP" and vim.lsp.get_client_by_id(ctx.item.client_id).name

					if source == "Snippets" or (client == "basics_ls" and ctx.kind == "Snippet") then
						icon = "Snippet"
					elseif source == "Buffer" or (client == "basics_ls" and ctx.kind == "Text") then
						icon = "Text"
					elseif client == "emmet_language_server" then
						icon = "Emmet"
					end

					-- FIX for tokyonight
					local iconHl = vim.g.colors_name:find("tokyonight") and "BlinkCmpKind" or "BlinkCmpKind" .. ctx.kind

					return {
						{
							" " .. ctx.item.label .. " ",
							fill = true,
							hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
							-- max_width = 45,
						},
						{ icon .. ctx.icon_gap, hl_group = iconHl },
					}
				end,
			},
		},

		kind_icons = {
			Text = "Text",
			Method = "Method",
			Function = "Function",
			Constructor = "Constructor",
			Field = "Field",
			Variable = "Variable",
			Class = "Class",
			Interface = "Interface",
			Module = "Module",
			Property = "Property",
			Unit = "Unit",
			Value = "Value",
			Enum = "Enum",
			Keyword = "Keyword",
			Snippet = "Snippet",
			Color = "Color",
			Reference = "Reference",
			File = "File",
			Folder = "Folder",
			EnumMember = "EnumMember",
			Constant = "Constant",
			Struct = "Struct",
			Event = "Event",
			Operator = "Operator",
			TypeParameter = "TypeParameter",
		},
	},
}
