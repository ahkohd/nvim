return {
  dir = "~/Developer/where-was-i",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("where-was-i").setup({
      trail_length = 20,
      character = "█",
      debounce_ms = 150,
      active_buffer_only = false,
      excluded_buftypes = { "terminal", "prompt" },
      excluded_filetypes = { "difft", "highlight-info" },
      color = "Comment",
    })
  end,
}
