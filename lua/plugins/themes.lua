--luacheck: globals vim

local is_linux = vim.loop.os_uname().sysname == "Linux"

return {
	"typicode/bg.nvim",
	event = "BufEnter",
  keys = {
    {
      "<leader>T",
      function()
        require("core.utils.buffer").redir_to_buffer_with_colors("highlight", "Highlight Groups")
      end,
      desc = "Highlight Groups",
    },
  },
	dependencies = {
    {
      "RedsXDD/neopywal.nvim",
      name = "neopywal",
      commit = "09188d7",
      cond = is_linux,
      opts = {
        use_palette = {
          light = "wallust",
          dark = "wallust",
        },
        transparent_background = true,
        terminal_colors = true
      },
      config = function(_, opts)
        require("neopywal").setup(opts)
        vim.cmd.colorscheme("neopywal")
      end,
    },
		{
			"LmanTW/themify.nvim",
      commit = "789c775",
	    cond = not is_linux,
			keys = {
				{
					"<leader>t",
					"<cmd>Themify<CR>",
					desc = "Theme",
				},
			},
			config = function()
				require("themify").setup({
					"folke/tokyonight.nvim",
					"catppuccin/nvim",
					"monochrome",
					"projekt0n/github-nvim-theme",
					"everviolet/nvim",
					"kyazdani42/blue-moon",
					"Mofiqul/vscode.nvim",
					"marko-cerovac/material.nvim",
				})
			end,
		},
	},
}
