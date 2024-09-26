-- luacheck: globals vim

return {
	"tamton-aquib/duck.nvim",
	keys = {
		{
			"<space>cd",
			function()
				local utils = require("core.utils.duck")

				require("duck").hatch(utils.random_emoji())
			end,
			desc = "Duck / hatch",
		},
		{
			"<space>ck",
			function()
				require("duck").cook()
			end,
			desc = "Duck / Cook",
		},
		{
			"<space>ca",
			function()
				require("duck").cook_all()
			end,
			desc = "Duck / Cook all",
		},
	},
	config = function()
		-- vim.api.nvim_create_autocmd("BufNew", {
		-- 	pattern = "*",
		-- 	callback = function()
		-- 		local utils = require("core.utils.duck")
		--
		-- 		require("duck").hatch(utils.random_emoji())
		-- 	end,
		-- })
	end,
}
