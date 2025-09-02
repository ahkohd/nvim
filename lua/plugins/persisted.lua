return {
  "olimorris/persisted.nvim",
  event = "BufReadPre",
  keys = {
    {
      "<leader>j",
      "<cmd>SessionSelect<cr>",
      desc = "Load Session"
    }
  },
  config = function()
    local save_dir = vim.fn.stdpath("data") .. "/sessions/"

    if vim.fn.isdirectory(save_dir) == 0 then
      vim.fn.mkdir(save_dir, "p")
    end

    require("persisted").setup({
      autostart = true,
      autoload = true,
      save_dir = save_dir,
      follow_cwd = true,
      use_git_branch = false,
      should_save = function()
        -- Don't save sessions for certain file types
        if vim.bo.filetype == "alpha" or vim.bo.filetype == "" then
          return false
        end
        return true
      end,
      allowed_dirs = {
        "~/.dotfiles",
        "~/Developer",
      }
    })
  end,
}
