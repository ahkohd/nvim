-- luacheck: globals vim Snacks

local md_path = vim.fn.expand("~") .. "/Documents/md"

return {
  {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown",
    opts = {},
    config = function(_, opts)
      require("markdown-plus").setup(opts)

      -- Disable line numbers for markdown buffers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
        end,
      })
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function()
      local presets = require("markview.presets")

      -- Create custom bold highlight group for all headings
      vim.api.nvim_set_hl(0, "MarkdownHeadingBold", {
        fg = vim.api.nvim_get_hl(0, { name = "Constant" }).fg,
        bold = true,
      })

      -- Create custom highlight group for code blocks with transparent bg
      vim.api.nvim_set_hl(0, "MarkviewCodeTransparent", {
        bg = "NONE",
      })

      -- Custom list preset with bullet symbol
      local custom_list_items = {
        enable = true,
        shift_width = 0,
        marker_minus = {
          text = "•",
          hl = "MarkviewListItemMinus",
        },
        marker_plus = {
          text = "•",
          hl = "MarkviewListItemPlus",
        },
        marker_star = {
          text = "•",
          hl = "MarkviewListItemStar",
        },
      }

      -- Custom code block configuration
      local custom_code_blocks = {
        enable = true,
        style = "simple",
        min_width = 10,
        pad_amount = 0,
        label_direction = "left",
        sign = false,
        border_hl = "MarkviewCodeTransparent",
        info_hl = "MarkviewCodeTransparent",
        default = {
          block_hl = "MarkviewCodeTransparent",
          pad_hl = "MarkviewCodeTransparent",
        },
        ["string"] = {
          block_hl = "MarkviewCodeTransparent",
          pad_hl = "MarkviewCodeTransparent",
        },
      }

      -- Custom heading preset
      local custom_headings = {
        enable = true,
        shift_width = 0,
        heading_1 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = "",
          icon_hl = "MarkdownHeadingBold",
        },
        heading_2 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = " ",
          icon_hl = "MarkdownHeadingBold",
        },
        heading_3 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = "  ",
        },
        heading_4 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = "   ",
          icon_hl = "MarkdownHeadingBold",
        },
        heading_5 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = "    ",
          icon_hl = "MarkdownHeadingBold",
        },
        heading_6 = {
          style = "label",
          align = "left",
          hl = "MarkdownHeadingBold",
          icon = "     ",
          icon_hl = "MarkdownHeadingBold",
        },
      }

      local config = vim.tbl_deep_extend("force", presets.no_nerd_fonts, {
        preview = {
          icon_provider = "internal",
        },
        markdown = {
          checkboxes = {
            enable = true,
          },
          list_items = custom_list_items,
          headings = custom_headings,
          code_blocks = custom_code_blocks,
          horizontal_rules = presets.horizontal_rules.thin,
          tables = presets.tables.rounded,
        },
      })
      return config
    end,
  },
  {
    "preservim/vim-pencil",
    ft = "markdown",
    keys = {
      {
        "<leader>'",
        function()
          vim.cmd("PencilToggle")
        end,
        desc = "Toggle Pencil",
      },
    },
    init = function()
      vim.g["pencil#wrapModeDefault"] = "soft"
      vim.g["pencil#autoformat"] = 1
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.cmd("PencilSoft")
        end,
      })
    end,
  },
  {
    "hedyhli/outline.nvim",
    event = {
      "BufReadPre " .. md_path .. "/*.md",
      "BufNewFile " .. md_path .. "/*.md",
    },
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle outline" },
      {
        "<leader>i",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer",
      },
      {
        "<leader>z",
        function()
          local buf = vim.api.nvim_get_current_buf()

          if not vim.g.dim_initialized then
            Snacks.dim.enable({ animate = { enabled = false } })
            vim.g.dim_initialized = true
            vim.b[buf].dim_active = true
          elseif vim.b[buf].dim_active then
            Snacks.dim.disable()
            vim.b[buf].dim_active = false
          else
            Snacks.dim()
            vim.b[buf].dim_active = true
          end
        end,
        desc = "Toggle zen mode",
      },
    },
    opts = {
      outline_window = {
        position = "right",
        width = 35,
        auto_close = false,
        focus_on_open = false,
        wrap = true,
        no_provider_message = ''
      },
      outline_items = {
        show_symbol_lineno = false,
        highlight_hovered_item = true,
        auto_set_cursor = true,
      },
      symbols = {
        icon_fetcher = function() return "" end,
        filter = { "String", exclude = true },
      },
      providers = {
        priority = { "markdown", "lsp" },
      },
      keymaps = {
        close = { "q" },
      },
    },
  },
}
