-- luacheck: globals vim

-- Text rendering (gamma controls brightness, contrast controls sharpness)
vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.2

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
-- vim.g.neovide_window_blurred = false

-- Hide mouse cursor while typing
vim.g.neovide_hide_mouse_when_typing = true

-- macOS Option key as Meta (both left and right)
-- vim.g.neovide_input_macos_option_key_is_meta = "both"

-- macOS keymappings (Cmd+S, Cmd+C, Cmd+V)
-- vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
-- vim.keymap.set("v", "<D-c>", '"+y') -- Copy
-- vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
-- vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
-- vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
-- vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
-- local function pasteFromClipboard()
-- 	local clipboard_content = vim.fn.getreg("+") -- '+' is the system clipboard register
-- 	vim.api.nvim_put({ clipboard_content }, "l", true, true)
-- end
-- vim.keymap.set("t", "<D-v>", pasteFromClipboard, { silent = true, noremap = true })
