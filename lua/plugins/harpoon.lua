return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<space>a",
			function()
				local harpoon = require("harpoon")

				harpoon:list():add()
			end,
			desc = "Harpoon / Add buffer",
		},
		{
			"<space>h",
			function()
				local harpoon = require("harpoon")

				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon / Toggle quick menu",
		},
		{
			"<space>z",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(1)
			end,
			desc = "Harpoon / #1",
		},
		{
			"<space>x",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(2)
			end,
			desc = "Harpoon / #2",
		},
		{
			"<space>t",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(3)
			end,
			desc = "Harpoon / #3",
		},
		{
			"<space>y",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(4)
			end,
			desc = "Harpoon / #4",
		},
		{
			"<space>n",
			function()
				local harpoon = require("harpoon")

				harpoon:list():prev()
			end,
		},
		{
			"<space>m",
			function()
				local harpoon = require("harpoon")

				harpoon:list():next()
			end,
		},
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()
	end,
}
