-- luacheck: globals vim

return {
	"b0o/incline.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"SmiteshP/nvim-navic",
	},
	event = "VeryLazy",
	config = function()
		-- Create custom highlight groups for transparent background
		vim.api.nvim_set_hl(0, "InclineNormalTransparent", {
			fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg,
			bg = "NONE",
		})

		local devicons = require("nvim-web-devicons")
		local navic = require("nvim-navic")

		require("incline").setup({
			hide = {
				cursorline = true,
			},
			highlight = {
				groups = {
					InclineNormal = "InclineNormalTransparent",
					InclineNormalNC = "InclineNormalTransparent",
				},
			},
			window = {
				padding = 1,
				margin = { vertical = 0, horizontal = 1 },
				placement = {
					horizontal = "left",
					vertical = "bottom",
				},
			},
			render = function(props)
				if props.focused then
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					local res = {
						-- ft_icon and { ' ', ft_icon, ' ', guibg = 'NONE', guifg = ft_color } or '',
						{ filename, gui = modified and "italic" or "" },
						guibg = "NONE",
					}
					if props.focused then
						for _, item in ipairs(navic.get_data(props.buf) or {}) do
							table.insert(res, {
								{ " ➜ ", group = "NavicSeparator" },
								{ item.icon, group = "NavicIcons" .. item.type },
								{ item.name, group = "NavicText" },
							})
						end
					end
					table.insert(res, " ")
					return res
				end

				return nil
			end,
		})
	end,
}
