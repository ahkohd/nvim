return {
	"wfxr/minimap.vim",
	event = "VeryLazy",
	cmd = { "Minimap", "MinimapToggle" },
	keys = {
		{ "<leader>mm", "<cmd>MinimapToggle<cr>", desc = "Toggle minimap" },
	},
	init = function()
		vim.g.minimap_width = 10
		vim.g.minimap_auto_start = 1
		vim.g.minimap_auto_start_win_enter = 1
		vim.g.minimap_highlight_range = 1
		vim.g.minimap_git_colors = 1
		vim.g.minimap_block_filetypes = {
			"fugitive",
			"nerdtree",
			"tagbar",
			"fzf",
			"float_terminal",
			"lazy",
			"mason",
		}
		vim.g.minimap_block_buftypes = {
			"nofile",
			"nowrite",
			"quickfix",
			"terminal",
			"prompt",
		}
	end,
}
