return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{
			"<leader>t",
			"<cmd>Outline<CR>",
			desc = "Outline",
		},
	},
	opts = {
		outline_window = {
			position = "left",
		},
		symbol_folding = {
			autofold_depth = 2,
			auto_unfold = {
				hovered = true,
			},
		},
		symbols = {
			icons = {
				File = { icon = "󰈙", hl = "Identifier" },
				Module = { icon = "󰆧", hl = "Include" },
				Namespace = { icon = "󰌗", hl = "Include" },
				Package = { icon = "󰏖", hl = "Include" },
				Class = { icon = "󰌗", hl = "Type" },
				Method = { icon = "󰊕", hl = "Function" },
				Property = { icon = "󰜢", hl = "Identifier" },
				Field = { icon = "󰜢", hl = "Identifier" },
				Constructor = { icon = "", hl = "Special" },
				Enum = { icon = "󰕘", hl = "Type" },
				Interface = { icon = "󰕘", hl = "Type" },
				Function = { icon = "󰊕", hl = "Function" },
				Variable = { icon = "󰀫", hl = "Constant" },
				Constant = { icon = "󰏿", hl = "Constant" },
				String = { icon = "󰀬", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Boolean = { icon = "◩", hl = "Boolean" },
				Array = { icon = "󰅪", hl = "Constant" },
				Object = { icon = "󰅩", hl = "Type" },
				Key = { icon = "󰌋", hl = "Type" },
				Null = { icon = "󰟢", hl = "Type" },
				EnumMember = { icon = "󰕘", hl = "Identifier" },
				Struct = { icon = "󰌗", hl = "Structure" },
				Event = { icon = "🗲", hl = "Type" },
				Operator = { icon = "+", hl = "Identifier" },
				TypeParameter = { icon = "󰊄", hl = "Identifier" },
			},
		},
	},
}
