return {
	"kyza0d/xeno.nvim",
	lazy = false,
	priority = 999,
	config = function()
		local xeno = require("xeno")
		xeno.new_theme("xeno-lilypad", {
			base = "#1E1E1E",
			accent = "#8CBE8C",
			contrast = 0.1,
		})
		xeno.new_theme("xeno-pink-haze", {
			base = "#0f0c0e",
			accent = "#D19EBC",
			contrast = 0.1,
		})
		xeno.new_theme("xeno-golden-hour", {
			base = "#11100f",
			accent = "#FFCC33",
			contrast = 0.1,
		})
	end,
}
