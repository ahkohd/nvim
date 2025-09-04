return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim"
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>j", "<cmd>Navbuddy<cr>", desc = "Outline" }
	},
  config = function()
    local icons = require("core.ui.icons").lsp_icons
    require('nvim-navic').setup {
      lsp = {
        auto_attach = true,
      },
      icons = icons
    }
    require("nvim-navbuddy").setup {
      window = {
        size = "90%",
      },
      lsp = {
        auto_attach = true,
      },
      icons = icons,
    }
  end
}
