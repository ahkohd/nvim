return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  config = function ()
		local utils = require("core.utils.lsp")
    require('typescript-tools').setup {
      on_attach = utils.on_attach
    }
  end
}
