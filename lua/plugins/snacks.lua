--luacheck: globals vim Snacks

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>go",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    -- pickers
    {
      "<leader>f",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },
    {
      "<leader>F",
      function()
        Snacks.picker.grep({
          layout = "dropdown",
        })
      end,
      desc = "Search (live grep)",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Search buffers",
    },
    {
      "<leader>j",
      function()
        Snacks.picker.jumps({
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Search jumplist",
    },
    {
      "<leader>J",
      function()
        Snacks.picker.marks({
          on_show = function()
            vim.cmd.stopinsert()
          end,
        })
      end,
      desc = "Search marks",
    },
    {
      "<leader>\\",
      function()
        Snacks.picker.help()
      end,
      desc = "Search helptags",
    },
    {
      "<leader>k",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Show code actions",
    },
    {
      "<leader>q",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Show Quickfix list",
    },
    {
      "<leader>Q",
      function()
        -- todo
      end,
      desc = "Show Quickfix stack",
    },
    {
      "<leader>P",
      function()
        Snacks.picker.projects()
      end,
      desc = "Search projects",
    },
  },
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    input = { enabled = true },
    picker = {
      layout = {
        preset = "dropdown",
        preview = false,
      },
      win = {
        input = {
          keys = {
            ["s"] = { "flash" },
          },
        },
      },
      actions = {
        flash = function(picker)
          require("flash").jump({
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win)
                  return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                end,
              },
            },
            action = function(match)
              local idx = picker.list:row2idx(match.pos[1])
              picker.list:_move(idx, true, true)
            end,
          })
        end,
      },
    },
  },
}
