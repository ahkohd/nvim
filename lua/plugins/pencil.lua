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
		vim.g["pencil#cursorwrap"] = 0 -- Disable j/k/arrow remapping
	end,
	config = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				local win = vim.api.nvim_get_current_win()
				local cfg = vim.api.nvim_win_get_config(win)
				-- Skip floating windows
				if cfg.relative ~= "" then
					return
				end
				-- Skip special buffer types
				local bt = vim.bo.buftype
				if bt == "nofile" or bt == "prompt" or bt == "quickfix" or bt == "terminal" then
					return
				end
				vim.cmd("PencilSoft")
			end,
		})
	end,
}

