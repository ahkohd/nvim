-- luacheck: globals vim

return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
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

			notify = {
				enabled = false,
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
	end,
}
