-- luacheck: globals vim

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = { "LspAttach", "InsertCharPre" },
	version = "v0.*",
	opts = {
		appearance = {
			nerd_font_variant = "mono",
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

		completion = {
			keyword = { range = "full" },
			accept = { auto_brackets = { enabled = false } },
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
				cycle = { from_bottom = true, from_top = false },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					min_width = 15,
					max_width = 50,
					max_height = 15,
					direction_priority = {
						menu_north = { "e", "w" },
						menu_south = { "e", "w", "s" },
					},
				},
			},
			ghost_text = { enabled = true },
		},

		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		keymap = {
			preset = "default",
			["<c-a>"] = { "show", "show_documentation", "hide_documentation" },
			["<c-j>"] = { "select_next" },
			["<c-k>"] = { "select_prev" },
			["<c-d>"] = { "scroll_documentation_down" },
			["<c-u>"] = { "scroll_documentation_up" },
		},
	},
}
