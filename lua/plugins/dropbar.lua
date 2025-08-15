return {
  'Bekaboo/dropbar.nvim',
  event = "VeryLazy",
  config = function()
    require('dropbar').setup({
      menu = {
        scrollbar = {
          enable = false,
        },
      },
    })

    -- Make dropbar transparent
    vim.api.nvim_set_hl(0, 'WinBar', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'WinBarNC', { bg = 'NONE' })

    -- Dropbar menu highlights to match tokyonight
    -- Menu background and borders
    vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { link = 'NormalFloat' })
    vim.api.nvim_set_hl(0, 'DropBarMenuFloatBorder', { link = 'FloatBorder' })

    -- Current selection in menu (matches tokyonight's Visual/CursorLine)
    vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { link = 'CursorLine' })

    -- Preview window
    vim.api.nvim_set_hl(0, 'DropBarPreview', { link = 'NormalFloat' })

    -- Menu entry highlights
    vim.api.nvim_set_hl(0, 'DropBarMenuEntry', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'DropBarMenuSbar', { link = 'PmenuSbar' })
    vim.api.nvim_set_hl(0, 'DropBarMenuThumb', { link = 'PmenuThumb' })

    -- Icon colors in menu to match tokyonight's semantic highlighting
    vim.api.nvim_set_hl(0, 'DropBarIconKindFunction', { link = '@function' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindMethod', { link = '@method' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindClass', { link = '@type' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindStruct', { link = '@type' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindVariable', { link = '@variable' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindConstant', { link = '@constant' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindProperty', { link = '@property' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindField', { link = '@field' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindEnum', { link = '@type' })
    vim.api.nvim_set_hl(0, 'DropBarIconKindInterface', { link = '@type' })

    local dropbar = require('dropbar.api')
    vim.keymap.set('n', '<Leader>j', dropbar.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar.select_next_context, { desc = 'Select next context' })
  end
}
