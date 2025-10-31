-- luacheck: globals vim

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    {
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
    {
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
  },
  opts = {
    highlight = {
      backdrop = false,
    },
    jump = {
      autojump = true,
      nohlsearch = true
    },
    labels = "asdfghjkl",
    modes = {
      char = {
        enabled = true,
        char_actions = function()
          return {
            [";"] = "next",
            [","] = "prev",
            ["F"] = "left",
            ["f"] = "right"
          }
        end,
        keys = { "f", "F", "t", "T", ";", "," },
        highlight = {
          backdrop = false
        },
        jump_labels = true,
        multi_line = true
      },
      search = {
        enabled = true,
        forward = true,
        wrap = true,
        highlight = {
          backdrop = false
        },
        jump = {
          autojump = false
        }
      },
      treesitter = {
        labels = "asdfghjkl",
      }
    },
    prompt = {
      win_config = { border = "none" }
    },
    search = {
      wrap = true
    }
  }
}
