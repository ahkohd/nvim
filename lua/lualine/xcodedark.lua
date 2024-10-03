-- Lualine theme for Xcode Dark
local colors = {
	black = "#292a30",
	white = "#a3b1bf",
	red = "#ff8170",
	green = "#78c2b3",
	blue = "#4eb0cc",
	yellow = "#d9c97c",
	purple = "#b281eb",
	pink = "#ff7ab2",
	grey = "#7f8c98",
	dark_grey = "#53606e",
	darker_grey = "#414453",
}

return {
	normal = {
		a = { fg = colors.black, bg = colors.grey, gui = "bold" },
		b = { fg = colors.black, bg = colors.dark_grey },
		c = { fg = colors.white, bg = colors.darker_grey },
	},
	insert = {
		a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
	},
	visual = {
		a = { fg = colors.black, bg = colors.pink, gui = "bold" },
	},
	replace = {
		a = { fg = colors.black, bg = colors.purple, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.white, bg = colors.darker_grey },
		b = { fg = colors.white, bg = colors.darker_grey },
		c = { fg = colors.white, bg = colors.darker_grey },
	},
}
