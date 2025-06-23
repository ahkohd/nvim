return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	config = function()
		-- Create custom highlight groups for transparent background
		vim.api.nvim_set_hl(0, "InclineNormalTransparent", {
			fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg,
			bg = "NONE",
		})

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
			},
			render = function(props)
				if props.focused then
					return require("incline.presets").basic(props)
				end

				return nil
			end,
		})
	end,
}
