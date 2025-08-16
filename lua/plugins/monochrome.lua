-- luacheck: globals vim

return {
	"monochrome",
	name = "monochrome",
	dir = vim.fn.stdpath("config"),
	lazy = false,
	priority = 1000,
	config = function()
		require("themes.monochrome").setup()

		-- Dropbar monochrome theme highlights
		local c = require("themes.monochrome").colors

		-- Active window dropbar highlights
		vim.api.nvim_set_hl(0, "DropBarCurrentContext", { bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarCurrentContextName", { fg = c.white, bg = c.one_bg2, bold = true })
		vim.api.nvim_set_hl(0, "DropBarHover", { bg = c.one_bg3 })

		-- Icon kinds - using monochrome colors
		vim.api.nvim_set_hl(0, "DropBarIconKindDefault", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindArray", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindBoolean", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindBreakStatement", { fg = c.red })
		vim.api.nvim_set_hl(0, "DropBarIconKindCall", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindCaseStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindClass", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindConstant", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindConstructor", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindContinueStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindDeclaration", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindDelete", { fg = c.red })
		vim.api.nvim_set_hl(0, "DropBarIconKindDoStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindElseStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindEnum", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindEnumMember", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindEvent", { fg = c.pink })
		vim.api.nvim_set_hl(0, "DropBarIconKindField", { fg = c.teal })
		vim.api.nvim_set_hl(0, "DropBarIconKindFile", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindFolder", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindForStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindFunction", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindGotoStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindIdentifier", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindIfStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindInterface", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindKeyword", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindList", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindMacro", { fg = c.red })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH1", { fg = c.blue, bold = true })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH2", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH3", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH4", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH5", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH6", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindMethod", { fg = c.blue })
		vim.api.nvim_set_hl(0, "DropBarIconKindModule", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindNamespace", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindNull", { fg = c.red })
		vim.api.nvim_set_hl(0, "DropBarIconKindNumber", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindObject", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindOperator", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindPackage", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindPair", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindProperty", { fg = c.teal })
		vim.api.nvim_set_hl(0, "DropBarIconKindReference", { fg = c.teal })
		vim.api.nvim_set_hl(0, "DropBarIconKindRepeat", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindReturnStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindRuleSet", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindScope", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindSection", { fg = c.blue, bold = true })
		vim.api.nvim_set_hl(0, "DropBarIconKindSpecifier", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindString", { fg = c.green })
		vim.api.nvim_set_hl(0, "DropBarIconKindStruct", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindSwitchStatement", { fg = c.purple })
		vim.api.nvim_set_hl(0, "DropBarIconKindTable", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindType", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindTypeParameter", { fg = c.yellow })
		vim.api.nvim_set_hl(0, "DropBarIconKindUnit", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindValue", { fg = c.orange })
		vim.api.nvim_set_hl(0, "DropBarIconKindVariable", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindWhileStatement", { fg = c.purple })

		-- UI elements
		vim.api.nvim_set_hl(0, "DropBarIconUIPickPivot", { fg = c.red, bold = true })
		vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarIconUISeparatorMenu", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverIcon", { bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverSymbol", { bg = c.one_bg2, bold = true })
		vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat", { fg = c.white, bg = c.black2 })
		vim.api.nvim_set_hl(0, "DropBarMenuSbar", { bg = c.one_bg })
		vim.api.nvim_set_hl(0, "DropBarMenuThumb", { bg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarPreview", { bg = c.one_bg })

		-- Inactive window dropbar highlights (NC = Non-Current)
		-- Using dimmed colors for inactive windows
		local dim_factor = 0.6
		vim.api.nvim_set_hl(0, "DropBarIconKindDefaultNC", { fg = c.grey })

		-- Set all NC (non-current) highlights to dimmed grey
		local nc_kinds = {
			"Array",
			"Boolean",
			"BreakStatement",
			"Call",
			"CaseStatement",
			"Class",
			"Constant",
			"Constructor",
			"ContinueStatement",
			"Declaration",
			"Delete",
			"DoStatement",
			"ElseStatement",
			"Enum",
			"EnumMember",
			"Event",
			"Field",
			"File",
			"Folder",
			"ForStatement",
			"Function",
			"GotoStatement",
			"Identifier",
			"IfStatement",
			"Interface",
			"Keyword",
			"List",
			"Macro",
			"MarkdownH1",
			"MarkdownH2",
			"MarkdownH3",
			"MarkdownH4",
			"MarkdownH5",
			"MarkdownH6",
			"Method",
			"Module",
			"Namespace",
			"Null",
			"Number",
			"Object",
			"Operator",
			"Package",
			"Pair",
			"Property",
			"Reference",
			"Repeat",
			"ReturnStatement",
			"RuleSet",
			"Scope",
			"Section",
			"Specifier",
			"Statement",
			"String",
			"Struct",
			"SwitchStatement",
			"Table",
			"Type",
			"TypeParameter",
			"Unit",
			"Value",
			"Variable",
			"WhileStatement",
		}

		for _, kind in ipairs(nc_kinds) do
			vim.api.nvim_set_hl(0, "DropBarIconKind" .. kind .. "NC", { fg = c.grey })
			vim.api.nvim_set_hl(0, "DropBarKind" .. kind .. "NC", { fg = c.grey })
		end
	end,
}
