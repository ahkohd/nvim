--luacheck: globals vim

local is_linux = vim.loop.os_uname().sysname == "Linux"

return {
	"typicode/bg.nvim",
  event = "BufEnter",
	dependencies = {
    -- {
    --   "nvim-mini/mini.hues",
    --   cond = is_linux,
    --   config = function()
    --     local color_utils = require("core.utils.colors")
    --     local colors = color_utils.load_wallust_colors()
    --     if not colors then
    --       return
    --     end
    --
    --     require("mini.hues").setup({
    --       background = colors.background,
    --       foreground = colors.foreground,
    --       n_hues = 8,
    --       saturation = 'medium',
    --       accent = 'bg',
    --     })
    --
    --     -- Set backgrounds to transparent for terminal opacity
    --     local transparent_groups = {
    --       "Normal",
    --       "NormalFloat",
    --       "FloatBorder",
    --       "FloatTitle",
    --       "Pmenu",
    --       "PmenuSel",
    --       "PmenuThumb",
    --       "StatusLine",
    --       "TabLine",
    --       "TabLineSel",
    --       "WinBar",
    --       "WinBarNC",
    --       "SignColumn",
    --       "DiagnosticFloatingError",
    --       "DiagnosticFloatingWarn",
    --       "DiagnosticFloatingInfo",
    --       "DiagnosticFloatingHint",
    --     }
    --
    --     for _, group in ipairs(transparent_groups) do
    --       vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    --     end
    --   end
    -- },
    {
      "nvim-mini/mini.base16",
      cond = is_linux,
      config = function()
        local color_utils = require("core.utils.colors")
        local colors = color_utils.load_wallust_colors()
        if not colors then
          return
        end

        -- Map wallust colors to base16 palette
        local palette = {
          base00 = colors.color0,  -- Default Background
          base01 = colors.color1,  -- Lighter Background
          base02 = colors.color2,  -- Selection Background
          base03 = colors.color3,  -- Comments, Invisibles
          base04 = colors.color4,  -- Dark Foreground
          base05 = colors.color5,  -- Default Foreground
          base06 = colors.color6,  -- Light Foreground
          base07 = colors.color7,  -- Light Background
          base08 = colors.color8,  -- Variables, XML Tags, Markup Link Text
          base09 = colors.color9,  -- Integers, Boolean, Constants
          base0A = colors.color10, -- Classes, Markup Bold, Search Text
          base0B = colors.color11, -- Strings, Markup Code, Diff Inserted
          base0C = colors.color12, -- Support, Regular Expressions, Escape Characters
          base0D = colors.color13, -- Functions, Methods, Attribute IDs, Headings
          base0E = colors.color14, -- Keywords, Storage, Selector, Markup Italic
          base0F = colors.color15, -- Deprecated, Opening/Closing Embedded Tags
        }

        require("mini.base16").setup({ palette = palette })

        -- Set backgrounds to transparent for terminal opacity
        local transparent_groups = {
          "Normal",
          "NormalNC",
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",
          "FloatFooter",
          "FloatShadow",
          "FloatShadowThrough",
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",
          "StatusLine",
          "StatusLineNC",
          "TabLine",
          "TabLineFill",
          "TabLineSel",
          "WinBar",
          "WinBarNC",
          "SignColumn",
          "LineNr",
          "LineNrAbove",
          "LineNrBelow",
          "CursorLineNr",
          "CursorLineSign",
          "FoldColumn",
          "Folded",
          "EndOfBuffer",
          "MsgSeparator",
          "ColorColumn",
          "CursorLine",
          "CursorColumn",
          -- Diagnostics floating
          "DiagnosticFloatingError",
          "DiagnosticFloatingHint",
          "DiagnosticFloatingInfo",
          "DiagnosticFloatingOk",
          "DiagnosticFloatingWarn",
          "MsgArea",
        }

        for _, group in ipairs(transparent_groups) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end

        -- Dim line numbers and end-of-buffer tildes
        vim.api.nvim_set_hl(0, "LineNr", { fg = colors.color8, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.color8, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.color8, bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.color0, bg = "NONE" })

        -- Better contrast for matching parens
        vim.api.nvim_set_hl(0, "MatchParen", { bg = colors.color8, fg = colors.foreground, bold = true })

        -- Match all borders to line number color
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.color8, bg = "NONE" })
        vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.color8, bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.color8, bg = "NONE" })

        -- Ensure Visual mode has visible background for contrast
        vim.api.nvim_set_hl(0, "Visual", { bg = colors.color8, fg = colors.foreground })
        vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.color8, fg = colors.foreground })

        -- Better contrast for search highlights
        vim.api.nvim_set_hl(0, "Search", { bg = colors.color3, fg = colors.background })
        vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.color6, fg = colors.background })
        vim.api.nvim_set_hl(0, "CurSearch", { bg = colors.color6, fg = colors.background })

        -- Better contrast for flash.nvim labels
        vim.api.nvim_set_hl(0, "FlashLabel", { bg = colors.color6, fg = colors.background, bold = true })
        vim.api.nvim_set_hl(0, "FlashMatch", { bg = colors.color3, fg = colors.background })
        vim.api.nvim_set_hl(0, "FlashCurrent", { bg = colors.color6, fg = colors.background, bold = true })

        -- Make which-key elements transparent
        vim.api.nvim_set_hl(0, "WhichKey", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyGroup", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyDesc", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeySeparator", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyValue", { bg = "NONE" })

        -- Give blink.cmp menu a visible background with better contrast
        vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = colors.color0, fg = colors.foreground })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = colors.color0 })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.color8, fg = colors.foreground })
        vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = colors.color0, fg = colors.foreground })
        vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = colors.color0 })

        -- Fix lspkind icons - remove bg and convert bg color to fg
        local pmenu_kind = vim.api.nvim_get_hl(0, { name = "PmenuKind" })
        if pmenu_kind.bg then
          vim.api.nvim_set_hl(0, "PmenuKind", { fg = string.format("#%06x", pmenu_kind.bg), bg = "NONE" })
        end

        local pmenu_kind_sel = vim.api.nvim_get_hl(0, { name = "PmenuKindSel" })
        if pmenu_kind_sel.bg then
          vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = string.format("#%06x", pmenu_kind_sel.bg), bg = "NONE" })
        end

        -- Dim LSP reference highlights
        vim.api.nvim_set_hl(0, "LspReferenceText", { bg = colors.color0, fg = "NONE" })
        vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = colors.color0, fg = "NONE" })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = colors.color0, fg = "NONE" })
      end
    },
    {
      "LmanTW/themify.nvim",
      commit = "789c775",
      cond = not is_linux,
      keys = {
        {
          "<leader>tc",
            function()
            local buffer_utils = require("core.utils.buffer")

            if buffer_utils.in_special_buffer() then return end
              vim.cmd("Themify")
            end,
          desc = "Theme",
        },
      },
      config = function()
        require("themify").setup({
          "folke/tokyonight.nvim",
          "catppuccin/nvim",
          "monochrome",
          "projekt0n/github-nvim-theme",
          "everviolet/nvim",
          "kyazdani42/blue-moon",
          "Mofiqul/vscode.nvim",
          "marko-cerovac/material.nvim",
        })
      end,
    },
	},
}
