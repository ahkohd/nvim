-- luacheck: globals vim

-- Text rendering (gamma controls brightness, contrast controls sharpness)
vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.2

-- Background opacity
vim.g.neovide_opacity = 0.85

-- Refresh rate
vim.g.neovide_refresh_rate = 240

-- Line spacing
vim.opt.linespace = 10

-- Floating window effects
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_blur_amount_x = 0
vim.g.neovide_floating_blur_amount_y = 0

-- Very small cursor trail/smear
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_vfx_mode = ""

-- Faster cursor long animation (default: 0.13)
vim.g.neovide_cursor_animation_length = 0.13
-- Faster cursor short animation (default: 0.04)
vim.g.neovide_cursor_short_animation_length = 0.04

-- Enable cursor blink (slower)
vim.opt.guicursor = {
	"n-v-c:block-blinkwait1000-blinkoff700-blinkon700",
	"i-ci-ve:ver25-blinkwait1000-blinkoff700-blinkon700",
	"r-cr:hor20-blinkwait1000-blinkoff700-blinkon700",
}
vim.g.neovide_cursor_smooth_blink = true

-- Scroll animation (default: 0.3)
vim.g.neovide_scroll_animation_length = 0.5

-- Disable window blur on macOS
vim.g.neovide_window_blurred = false

-- Hide mouse cursor while typing
vim.g.neovide_hide_mouse_when_typing = true
