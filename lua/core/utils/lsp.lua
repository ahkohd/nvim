-- luacheck: globals vim

local lua_globals = {
	"vim",
	"packer_plugins",
	"api",
	"fn",
	"loop",
}

local M = {
	lua_globals = lua_globals,
	on_attach = function() end,
}

return M
