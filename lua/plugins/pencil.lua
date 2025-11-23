return {
	"preservim/vim-pencil",
	event = "VeryLazy",
	keys = {
		{
			"<leader>'",
			function()
				vim.cmd("PencilToggle")
			end,
			desc = "Toggle Pencil",
		},
	},
	init = function()
		vim.g["pencil#wrapModeDefault"] = "soft"
		vim.g["pencil#autoformat"] = 1
	end,
	config = function()
		-- Enable PencilSoft for all file types
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				vim.cmd("PencilSoft")
			end,
		})
	end,
}

