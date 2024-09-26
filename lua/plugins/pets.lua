-- luacheck: globals vim

return {
	"ahkohd/pets.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
	event = "VeryLazy",
	keys = {
		{
			"<space>c",
			function()
				vim.cmd("PetsNew roscoe")

				vim.api.nvim_create_autocmd("VimResized", {
					callback = function()
						vim.cmd("PetsKill roscoe")

						vim.cmd("PetsNew roscoe")
					end,
				})
			end,
			desc = "Create new pet",
		},
	},
	config = function()
		require("pets").setup({
			default_pet = "dog",
			random = false,
			popup = {
				avoid_statusline = true,
				hl = { Normal = "Normal" },
			},
		})
	end,
}
