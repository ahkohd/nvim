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
			desc = "Add buffer to Harpoon",
		},
		{
			"<A-S-A>",
			function()
				local harpoon = require("harpoon")

				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Toggle Harpoon quick menu",
		},
		{
			"<A-S-T>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(1)
			end,
			desc = "Harpoon, select #1",
		},
		{
			"<A-S-G>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(2)
			end,
			desc = "Harpoon, select #2",
		},
		{
			"<A-S-B>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(3)
			end,
			desc = "Harpoon, select #3",
		},
		{
			"<A-S-Y>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(4)
			end,
			desc = "Harpoon, select #4",
		},
		{
			"<A-S-I>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():prev()
			end,
		},
		{
			"<A-S-O>",
			function()
				local harpoon = require("harpoon")

				harpoon:list():next()
			end,
		},
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})
	end,
}
