return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        claude = { cmd = { "claude", "--continue" }, url = "https://github.com/anthropics/claude-code" },
      },
      win =  {
        layout = "float",
        float = {
          width = 1.0,
          height = 0.8,
          border = "rounded",
          row = 1.0,
        },
        keys = {
          -- hide from terminal mode
          hide_t = { ";a", "hide" },
        }
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      ";a",
      function()
        -- Hide current floating terminal before toggling CLI
        if _G.FloatTerminal then
          _G.FloatTerminal.hide_current_terminal()
        end
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick Claude Toggle",
      mode = { "n", "v" },
    },
    {
      ";p",
      function()
        require("sidekick.cli").select_prompt()
      end,
      desc = "Sidekick Ask Prompt",
      mode = { "n", "v" },
    },
  },
}
