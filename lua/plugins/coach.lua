-- luacheck: globals vim

return {
  "shahshlok/vim-coach.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    vim.g.vim_coach_no_default_keymaps = 1

    require("vim-coach").setup()
  end,
  keys = {
    { "<leader>?", "<cmd>VimCoach<cr>", desc = "Vim Coach" },
  },
}
