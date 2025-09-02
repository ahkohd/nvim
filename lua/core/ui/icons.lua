local M = {}

M.git = ""

M.error = " "

M.warn = " "

M.info = " "

M.hint = " "

M.lsp_kinds = {
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
}

-- Derive icons only for navbuddy
M.lsp_icons = {}
for key, value in pairs(M.lsp_kinds) do
	M.lsp_icons[key] = value.icon .. " "
end

return M
