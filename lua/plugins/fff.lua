local buffer_utils = require("core.utils.buffer")

return {
	"dmtrKovalenko/fff.nvim",
	lazy = false,
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = "➜ ",
	},
	keys = {
		{
			"<leader>f",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				require("fff").find_files()
			end,
			desc = "Files",
		},
		{
			"<leader>r",
			function()
				if buffer_utils.in_special_buffer() then
					return
				end
				require("fff").live_grep({
				grep = { modes = { "fuzzy", "plain", "regex" } },
			})
			end,
			desc = "Grep",
		},
	},
}
