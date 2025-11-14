return {
	dir = "~/Developer/namu.nvim/",
	event = "VeryLazy",
	keys = {
		{
			"<leader>i",
			":Namu symbols<cr>",
			{
				desc = "Buffer symbols",
			},
		},
		{
			"<leader>o",
			":Namu watchtower<cr>",
			{
				desc = "Buffers symbols",
			},
		},
		{
			"<leader>p",
			":Namu workspace<cr>",
			{
				desc = "Workspace symbols",
			},
		},
		{
			"<leader>e",
			":Namu diagnostics<cr>",
			{
				desc = "Diagnostics",
			},
		},
		{
			"<leader>ci",
			":Namu call in<cr>",
			{
				desc = "Call in",
			},
		},
		{
			"<leader>co",
			":Namu call out<cr>",
			{
				desc = "Call out",
			},
		},
		{
			"<leader>cb",
			":Namu call both<cr>",
			{
				desc = "Call both",
			},
		},
	},
	opts = {
		global = {
			display = {
				mode = "icon",
				format = "tree_guides",
			},
			window = {
				title_prefix = " ",
				border = "rounded",
				show_footer = false,
			},
			source = {
				filter = {
					default = {
						"Function",
						"Method",
						"Class",
						"Module",
						"Property",
						"Variable",
						"Struct",
					},
				},
			},
			kindIcons = {
				File = "File",
				Module = "Module",
				Namespace = "Namespace",
				Package = "Package",
				Class = "Class",
				Method = "Method",
				Property = "Property",
				Field = "Field",
				Constructor = "Constructor",
				Enum = "Enum",
				Interface = "Interface",
				Function = "Function",
				Variable = "Variable",
				Constant = "Constant",
				String = "String",
				Number = "Number",
				Boolean = "Boolean",
				Array = "Array",
				Object = "Object",
				Key = "Key",
				Null = "Null",
				EnumMember = "EnumMember",
				Struct = "Struct",
				Event = "Event",
				Operator = "Operator",
				TypeParameter = "TypeParameter",
			},
		},
		ui_select = {
			window = {
				title_prefix = " ",
			},
			display = {
				padding = 2,
			},
		},
	},
}
