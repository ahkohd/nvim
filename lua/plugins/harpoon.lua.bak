return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	cmd = "Harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>h",
			function()
				local harpoon = require("harpoon")

				harpoon:list():add()
			end,
			desc = "Harpoon / Add buffer",
		},
		{
			"<leader>H",
			function()
				local harpoon = require("harpoon")

				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon / Toggle UI",
		},
		{
			"<leader>z",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(1)
			end,
			desc = "Harpoon / Buffer #1",
		},
		{
			"<leader>Z",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(2)
			end,
			desc = "Harpoon / Buffer #2",
		},
		{
			"<leader>x",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(3)
			end,
			desc = "Harpoon / Buffer #3",
		},
		{
			"<leader>X",
			function()
				local harpoon = require("harpoon")

				harpoon:list():select(4)
			end,
			desc = "Harpoon / Buffer #4",
		},
		{
			"<leader>-",
			function()
				local harpoon = require("harpoon")

				harpoon:list():prev()
			end,
			desc = "Harpoon / Prev Buffer",
		},
		{
			"<leader>_",
			function()
				local harpoon = require("harpoon")

				harpoon:list():next()
			end,
			desc = "Harpoon / Next Buffer",
		},
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()
	end,
}
