return {
  dir = "~/Developer/nvim/lua/dev",
  name = "inspect-highlight",
  keys = {
    {
      "<leader>thi",
      function()
        require("dev.inspect_highlight").inspect()
      end,
      desc = "Inspect highlight under cursor",
    },
    {
      "<leader>thl",
      function()
        local buffer_utils = require("core.utils.buffer")
        if buffer_utils.in_special_buffer() then return end
        require("dev.inspect_highlight").list_highlights()
      end,
      desc = "List all highlight groups",
    },
  },
  config = function()
    require("dev.inspect_highlight").setup()
  end
}
