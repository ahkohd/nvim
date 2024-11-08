-- luacheck: globals vim

return {
	"saghen/blink.cmp",
	event = { "LspAttach", "InsertCharPre" },
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		nerd_font_variant = "mono",

		-- experimental auto-brackets support
		accept = { auto_brackets = { enabled = true } },

		-- experimental signature help support
		trigger = {
			-- completion = {
			-- 	keyword_range = "prefix",
			-- },
			signature_help = { enabled = true },
		},

		keymap = {
			preset = "default",
			["<c-a>"] = { "show", "show_documentation", "hide_documentation" },
			["<c-j>"] = { "select_next" },
			["<c-k>"] = { "select_prev" },
			["<c-d>"] = { "scroll_documentation_down" },
			["<c-u>"] = { "scroll_documentation_up" },
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
