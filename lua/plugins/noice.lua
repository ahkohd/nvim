-- luacheck: globals vim

return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},

			presets = {
				long_message_to_split = true, -- long messages will be sent to a split
			},

			cmdline = {
				view = "cmdline",
				format = {
					search_down = {
						view = "cmdline",
						icon = " ",
					},
					search_up = {
						view = "cmdline",
						icon = " ",
					},
				},
			},
		})

		require("notify").setup({
			timeout = 1500,

			render = "minimal",
			-- render = "wrapped-compact",
			-- max_width = 40,

			stages = "static",

			top_down = false,

			on_open = function(win)
				vim.api.nvim_win_set_config(win, { focusable = false })
			end,
		})
	end,
}
