-- luacheck: globals vim

return {
	"monaqa/dial.nvim",
	event = "VeryLazy",
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal_int,
				augend.integer.alias.hex,
				augend.date.alias["%d/%m/%Y"],
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%d.%m.%Y"],
				augend.date.alias["%m/%d"],
				augend.date.alias["%H:%M"],
				augend.semver.alias.semver,
				augend.constant.alias.bool,
				augend.constant.new({
					elements = { "and", "or" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "True", "False" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "Enable", "Disable" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "enable", "disable" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "ENABLE", "DISABLE" },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" },
					word = true,
					cyclic = true,
				}),
			},
		})

		vim.cmd([[
        nmap  <C-a>  <Plug>(dial-increment)
        nmap  <C-x>  <Plug>(dial-decrement)
        nmap g<C-a> g<Plug>(dial-increment)
        nmap g<C-x> g<Plug>(dial-decrement)
        vmap  <C-a>  <Plug>(dial-increment)
        vmap  <C-x>  <Plug>(dial-decrement)
        vmap g<C-a> g<Plug>(dial-increment)
        vmap g<C-x> g<Plug>(dial-decrement)
        ]])
	end,
}
