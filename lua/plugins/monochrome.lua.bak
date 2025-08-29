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

		-- Active window dropbar highlights - subtle monochrome style
		vim.api.nvim_set_hl(0, "DropBarCurrentContext", { bg = c.one_bg })
		vim.api.nvim_set_hl(0, "DropBarCurrentContextName", { fg = c.white, bg = c.one_bg })
		vim.api.nvim_set_hl(0, "DropBarHover", { bg = c.one_bg2 })

		-- Icon kinds - true monochrome: only shades of gray
		vim.api.nvim_set_hl(0, "DropBarIconKindDefault", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindArray", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindBoolean", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindBreakStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindCall", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindCaseStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindClass", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindConstant", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindConstructor", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindContinueStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindDeclaration", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindDelete", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindDoStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindElseStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindEnum", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindEnumMember", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindEvent", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindField", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindFile", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindFolder", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindForStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindFunction", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindGotoStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindIdentifier", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindIfStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindInterface", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindKeyword", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindList", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindMacro", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH1", { fg = c.white, bold = true })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH2", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH3", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH4", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH5", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindMarkdownH6", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindMethod", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindModule", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindNamespace", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindNull", { fg = c.grey_fg })
		vim.api.nvim_set_hl(0, "DropBarIconKindNumber", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindObject", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindOperator", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindPackage", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindPair", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindProperty", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindReference", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindRepeat", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindReturnStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindRuleSet", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindScope", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindSection", { fg = c.white, bold = true })
		vim.api.nvim_set_hl(0, "DropBarIconKindSpecifier", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindString", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindStruct", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindSwitchStatement", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindTable", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindType", { fg = c.white })
		vim.api.nvim_set_hl(0, "DropBarIconKindTypeParameter", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindUnit", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindValue", { fg = c.grey_fg2 })
		vim.api.nvim_set_hl(0, "DropBarIconKindVariable", { fg = c.light_grey })
		vim.api.nvim_set_hl(0, "DropBarIconKindWhileStatement", { fg = c.grey_fg2 })

		-- UI elements - also monochrome
		vim.api.nvim_set_hl(0, "DropBarIconUIPickPivot", { link = "@keyword" })
		vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarIconUISeparatorMenu", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverIcon", { fg = c.white, bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverSymbol", { fg = c.white, bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverEntry", { fg = c.white, bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat", { fg = c.light_grey, bg = c.black2 })
		vim.api.nvim_set_hl(0, "DropBarMenuSbar", { bg = c.one_bg })
		vim.api.nvim_set_hl(0, "DropBarMenuThumb", { bg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarPreview", { bg = c.one_bg })
		vim.api.nvim_set_hl(0, "DropBarMenuCurrentContext", { fg = c.white, bg = c.one_bg2 })
		vim.api.nvim_set_hl(0, "DropBarMenuHoverBackground", { bg = c.one_bg2 })

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
