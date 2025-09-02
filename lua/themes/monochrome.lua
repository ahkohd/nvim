-- luacheck: globals vim

-- NvChad's monochrome theme extracted from base46
-- Original credit: https://github.com/kdheepak/monochrome.nvim (modified by NvChad)

local M = {}

M.colors = {
	-- Base30 colors from NvChad
	white = "#D8DEE9",
	darker_black = "#1a1a1a",
	black = "#101010", --  nvim bg
	black2 = "#202020",
	one_bg = "#242424",
	one_bg2 = "#2e2e2e",
	one_bg3 = "#383838",
	grey = "#424242",
	grey_fg = "#4c4c4c",
	grey_fg2 = "#606060",
	light_grey = "#677777",
	red = "#ec8989",
	baby_pink = "#eca8a8",
	pink = "#da838b",
	line = "#2e2e2e",
	green = "#c9d36a",
	vibrant_green = "#eff6ab",
	blue = "#8abae1",
	nord_blue = "#a5c6e1",
	yellow = "#ffe6b5",
	sun = "#eff6ab",
	purple = "#e1bee9",
	dark_purple = "#db9fe9",
	teal = "#6484a4",
	orange = "#efb6a0",
	cyan = "#9aafe6",
	statusline_bg = "#1e1e1e",
	lightbg = "#2e2e2e",
	pmenu_bg = "#859ba2",
	folder_bg = "#7797b7",

	-- Base16 colors from NvChad
	base00 = "#101010",
	base01 = "#1f1f1f",
	base02 = "#2e2e2e",
	base03 = "#383838",
	base04 = "#424242",
	base05 = "#bfc5d0",
	base06 = "#c7cdd8",
	base07 = "#ced4df",
	base08 = "#eee8d5",
	base09 = "#B8B7B1",
	base0A = "#859ba2",
	base0B = "#7b9198",
	base0C = "#DFDFDA",
	base0D = "#ced4df",
	base0E = "#DAD4C3",
	base0F = "#ced4df",
}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "nvchad-monochrome"

	local c = M.colors

	-- Define highlight groups
	local highlights = {
		-- Editor highlights
		Normal = { fg = c.base05, bg = c.black },
		NormalFloat = { fg = c.base05, bg = c.black2 },
		FloatBorder = { fg = c.grey_fg },
		FloatTitle = { fg = c.white, bg = c.grey },

		-- Window/Buffer
		ColorColumn = { bg = c.black2 },
		Cursor = { fg = c.black, bg = c.white },
		CursorColumn = { bg = c.one_bg },
		CursorLine = { bg = c.one_bg },
		CursorLineNr = { fg = c.white, bold = true },
		LineNr = { fg = c.grey },
		SignColumn = { fg = c.grey, bg = c.black },
		VertSplit = { fg = c.line },
		WinSeparator = { fg = c.line },
		EndOfBuffer = { fg = c.black },
		Folded = { fg = c.light_grey, bg = c.one_bg },
		FoldColumn = { fg = c.grey, bg = c.black },

		-- Statusline
		StatusLine = { fg = c.base06, bg = c.statusline_bg },
		StatusLineNC = { fg = c.grey_fg, bg = c.statusline_bg },

		-- Popup menu
		Pmenu = { fg = c.white, bg = c.black2 },
		PmenuSel = { fg = c.black, bg = c.pmenu_bg, bold = true },
		PmenuSbar = { bg = c.one_bg2 },
		PmenuThumb = { bg = c.grey },

		-- Search
		Search = { fg = c.black, bg = c.yellow },
		IncSearch = { fg = c.black, bg = c.orange },
		CurSearch = { fg = c.black, bg = c.red },
		Substitute = { fg = c.black, bg = c.green },

		-- Visual
		Visual = { bg = c.one_bg3 },
		VisualNOS = { bg = c.one_bg2 },

		-- Messages
		ErrorMsg = { fg = c.red, bold = true },
		WarningMsg = { fg = c.yellow, bold = true },
		ModeMsg = { fg = c.green, bold = true },
		MoreMsg = { fg = c.green },
		Question = { fg = c.green },

		-- Syntax highlighting (using base16 scheme)
		Comment = { fg = c.grey_fg2, italic = true },

		-- Constants
		Constant = { fg = c.base09 },
		String = { fg = c.green },
		Character = { fg = c.green },
		Number = { fg = c.base09 },
		Boolean = { fg = c.base09 },
		Float = { fg = c.base09 },

		-- Identifiers
		Identifier = { fg = c.base08 },
		Function = { fg = c.base0D },

		-- Statements
		Statement = { fg = c.base0E },
		Conditional = { fg = c.base0E },
		Repeat = { fg = c.base0E },
		Label = { fg = c.base0A },
		Operator = { fg = c.base05 },
		Keyword = { fg = c.base0E, italic = true },
		Exception = { fg = c.base08 },

		-- Preprocs
		PreProc = { fg = c.base0A },
		Include = { fg = c.base0D },
		Define = { fg = c.base0E },
		Macro = { fg = c.base08 },
		PreCondit = { fg = c.base0A },

		-- Types
		Type = { fg = c.base0A },
		StorageClass = { fg = c.base0A },
		Structure = { fg = c.base0E },
		Typedef = { fg = c.base0A },

		-- Specials
		Special = { fg = c.base0C },
		SpecialChar = { fg = c.orange },
		Tag = { fg = c.base0A },
		Delimiter = { fg = c.base0F },
		SpecialComment = { fg = c.grey_fg },
		Debug = { fg = c.base08 },

		-- Other
		Underlined = { fg = c.green, underline = true },
		Ignore = { fg = c.grey },
		Error = { fg = c.red, bold = true },
		Todo = { fg = c.yellow, bg = c.one_bg, bold = true },

		-- Spell
		SpellBad = { undercurl = true, sp = c.red },
		SpellCap = { undercurl = true, sp = c.yellow },
		SpellLocal = { undercurl = true, sp = c.green },
		SpellRare = { undercurl = true, sp = c.purple },

		-- Diff
		DiffAdd = { fg = c.green },
		DiffChange = { fg = c.yellow },
		DiffDelete = { fg = c.red },
		DiffText = { fg = c.blue, bold = true },

		-- Git signs
		GitSignsAdd = { fg = c.green },
		GitSignsChange = { fg = c.yellow },
		GitSignsDelete = { fg = c.red },

		-- Diagnostic
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.purple },
		DiagnosticOk = { fg = c.green },

		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.purple },
		DiagnosticUnderlineOk = { undercurl = true, sp = c.green },

		-- LSP
		LspReferenceText = { bg = c.one_bg2 },
		LspReferenceRead = { bg = c.one_bg2 },
		LspReferenceWrite = { bg = c.one_bg2 },
		LspSignatureActiveParameter = { fg = c.black, bg = c.green },
		LspCodeLens = { fg = c.grey_fg },

		-- Treesitter
		["@variable"] = { fg = c.base05 },
		["@variable.builtin"] = { fg = c.red },
		["@variable.parameter"] = { fg = c.base08 },
		["@variable.member"] = { fg = c.base08 },

		["@constant"] = { fg = c.base09 },
		["@constant.builtin"] = { fg = c.base09 },
		["@constant.macro"] = { fg = c.base08 },

		["@module"] = { fg = c.base08 },
		["@label"] = { fg = c.base0A },

		["@string"] = { fg = c.green },
		["@string.regex"] = { fg = c.base0B },
		["@string.escape"] = { fg = c.base0C },
		["@string.special"] = { fg = c.base0C },

		["@character"] = { fg = c.green },
		["@character.special"] = { fg = c.base0F },

		["@boolean"] = { fg = c.base09 },
		["@number"] = { fg = c.base09 },
		["@float"] = { fg = c.base09 },

		["@function"] = { fg = c.base0D },
		["@function.builtin"] = { fg = c.base0D },
		["@function.call"] = { fg = c.base0D },
		["@function.macro"] = { fg = c.base08 },
		["@method"] = { fg = c.base0D },
		["@method.call"] = { fg = c.base0D },
		["@constructor"] = { fg = c.base0C },
		["@parameter"] = { fg = c.base08 },

		["@keyword"] = { fg = c.base0E, italic = true },
		["@keyword.coroutine"] = { fg = c.base0E },
		["@keyword.function"] = { fg = c.base0E },
		["@keyword.operator"] = { fg = c.base0E },
		["@keyword.return"] = { fg = c.base0E },

		["@conditional"] = { fg = c.base0E },
		["@repeat"] = { fg = c.base0E },
		["@debug"] = { fg = c.base08 },
		["@include"] = { fg = c.base0D },
		["@exception"] = { fg = c.base08 },

		["@type"] = { fg = c.base0A },
		["@type.builtin"] = { fg = c.base0A },
		["@type.definition"] = { fg = c.base0A },
		["@type.qualifier"] = { fg = c.base0E },

		["@storageclass"] = { fg = c.base0A },
		["@attribute"] = { fg = c.base0A },
		["@field"] = { fg = c.base08 },
		["@property"] = { fg = c.base08 },

		["@punctuation.delimiter"] = { fg = c.base0F },
		["@punctuation.bracket"] = { fg = c.red }, -- Special from polish_hl
		["@punctuation.special"] = { fg = c.base0F },

		["@comment"] = { fg = c.grey_fg2, italic = true },
		["@comment.documentation"] = { fg = c.base0C },

		["@tag"] = { fg = c.base0A },
		["@tag.attribute"] = { fg = c.base08 },
		["@tag.delimiter"] = { fg = c.base0F },

		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.underline"] = { underline = true },
		["@text.strike"] = { strikethrough = true },
		["@text.title"] = { fg = c.base0D, bold = true },
		["@text.literal"] = { fg = c.green },
		["@text.quote"] = { fg = c.grey_fg2 },
		["@text.uri"] = { fg = c.base0C, underline = true },
		["@text.math"] = { fg = c.base0C },
		["@text.reference"] = { fg = c.base0C },

		["@text.diff.add"] = { fg = c.green },
		["@text.diff.delete"] = { fg = c.red },

		["@namespace"] = { fg = c.base08 },
		["@operator"] = { fg = c.base05 },

		-- Telescope
		TelescopeNormal = { fg = c.white, bg = c.darker_black },
		TelescopeBorder = { fg = c.darker_black, bg = c.darker_black },
		TelescopePromptBorder = { fg = c.black2, bg = c.black2 },
		TelescopePromptNormal = { fg = c.white, bg = c.black2 },
		TelescopePromptPrefix = { fg = c.red, bg = c.black2 },
		TelescopeSelection = { bg = c.black2, fg = c.white },
		TelescopeSelectionCaret = { fg = c.red },
		TelescopeMatching = { fg = c.blue, bold = true },
		TelescopeResultsDiffAdd = { fg = c.green },
		TelescopeResultsDiffChange = { fg = c.yellow },
		TelescopeResultsDiffDelete = { fg = c.red },

		-- Cmp
		CmpItemAbbrMatch = { fg = c.blue, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.blue, bold = true },
		CmpItemKind = { fg = c.purple },
		CmpItemMenu = { fg = c.grey_fg },
		CmpItemAbbr = { fg = c.white },
		CmpItemAbbrDeprecated = { fg = c.light_grey, strikethrough = true },

		-- WhichKey
		WhichKey = { fg = c.blue },
		WhichKeyGroup = { fg = c.orange },
		WhichKeySeparator = { fg = c.grey_fg },
		WhichKeyDesc = { fg = c.white },
		WhichKeyValue = { fg = c.green },

		-- NvimTree/Explorer
		NvimTreeNormal = { fg = c.white, bg = c.darker_black },
		NvimTreeWinSeparator = { fg = c.darker_black, bg = c.darker_black },
		NvimTreeNormalNC = { fg = c.white, bg = c.darker_black },
		NvimTreeRootFolder = { fg = c.red, bold = true },
		NvimTreeGitDirty = { fg = c.yellow },
		NvimTreeGitNew = { fg = c.green },
		NvimTreeGitDeleted = { fg = c.red },
		NvimTreeFolderIcon = { fg = c.folder_bg },
		NvimTreeFolderName = { fg = c.folder_bg },
		NvimTreeFolderArrowOpen = { fg = c.folder_bg },
		NvimTreeFolderArrowClosed = { fg = c.grey_fg },
		NvimTreeOpenedFolderName = { fg = c.folder_bg, bold = true },
		NvimTreeEmptyFolderName = { fg = c.folder_bg },
		NvimTreeIndentMarker = { fg = c.grey_fg },
		NvimTreeSpecialFile = { fg = c.yellow, bold = true },
		NvimTreeImageFile = { fg = c.dark_purple },
		NvimTreeExecFile = { fg = c.green, bold = true },

		-- Indent lines
		IndentBlanklineChar = { fg = c.line },
		IndentBlanklineSpaceChar = { fg = c.line },
		IndentBlanklineContextChar = { fg = c.grey },
		IndentBlanklineContextStart = { underline = true, sp = c.grey },

		-- Snacks.nvim
		SnacksNormal = { fg = c.white, bg = c.darker_black },
		SnacksBorder = { fg = c.grey },
		SnacksTitle = { fg = c.white, bold = true },
	}

	-- Apply highlights
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Dropbar monochrome theme highlights
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
	vim.api.nvim_set_hl(0, "DropBarIconKindDefaultNC", { fg = c.grey })

	-- Set all NC (non-current) highlights to dimmed grey
	local nc_kinds = {
		"Array", "Boolean", "BreakStatement", "Call", "CaseStatement", "Class",
		"Constant", "Constructor", "ContinueStatement", "Declaration", "Delete",
		"DoStatement", "ElseStatement", "Enum", "EnumMember", "Event", "Field",
		"File", "Folder", "ForStatement", "Function", "GotoStatement", "Identifier",
		"IfStatement", "Interface", "Keyword", "List", "Macro", "MarkdownH1",
		"MarkdownH2", "MarkdownH3", "MarkdownH4", "MarkdownH5", "MarkdownH6",
		"Method", "Module", "Namespace", "Null", "Number", "Object", "Operator",
		"Package", "Pair", "Property", "Reference", "Repeat", "ReturnStatement",
		"RuleSet", "Scope", "Section", "Specifier", "Statement", "String", "Struct",
		"SwitchStatement", "Table", "Type", "TypeParameter", "Unit", "Value",
		"Variable", "WhileStatement"
	}

	for _, kind in ipairs(nc_kinds) do
		vim.api.nvim_set_hl(0, "DropBarIconKind" .. kind .. "NC", { fg = c.grey })
		vim.api.nvim_set_hl(0, "DropBarKind" .. kind .. "NC", { fg = c.grey })
	end

	-- Set terminal colors
	vim.g.terminal_color_0 = c.black
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.yellow
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = c.purple
	vim.g.terminal_color_6 = c.cyan
	vim.g.terminal_color_7 = c.white
	vim.g.terminal_color_8 = c.grey
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.purple
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.white
end

return M
