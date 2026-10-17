-- Run from the config directory: nvim --headless -u NONE -l scripts/check-yazi.lua
local root = vim.fn.tempname()
vim.fn.mkdir(root .. "/.git", "p")
vim.fn.mkdir(root .. "/src", "p")
vim.fn.writefile({ "test" }, root .. "/src/file.lua")
vim.cmd.edit(root .. "/src/file.lua")
local keys = dofile("lua/plugins/yazi.lua").keys
local terms, commands, input_count = {}, {}, 0
vim.cmd.startinsert = function()
	input_count = input_count + 1
end
_G.Snacks = {
	terminal = {
		list = function()
			return terms
		end,
		open = function(command, opts)
			local term = { cmd = command, win = vim.api.nvim_get_current_win(), visible = true }
			function term:buf_valid()
				return true
			end
			function term:win_valid()
				return self.visible
			end
			function term:hide()
				self.visible = false
			end
			function term:show()
				self.visible = true
			end
			table.insert(terms, term)
			table.insert(commands, command)
			assert(opts.start_insert and opts.auto_insert)
			return term
		end,
	},
}
local function press(index, expected_input)
	keys[index][2]()
	vim.wait(100, function()
		return input_count == expected_input
	end)
	assert(input_count == expected_input, "terminal input was not requested")
end
assert(keys[1][1] == "<leader>o" and keys[2][1] == "<leader>O")
press(1, 1)
assert(vim.startswith(commands[1], "yazi " .. vim.fn.shellescape(root .. "/src/file.lua") .. " --chooser-file="))
press(1, 1)
assert(not terms[1].visible, "toggle should hide")
press(1, 2)
assert(terms[1].visible and #terms == 1, "toggle should reuse hidden terminal")
press(2, 3)
assert(vim.startswith(commands[2], "yazi " .. vim.fn.shellescape(root) .. " --chooser-file="))
assert(not terms[1].visible and terms[2].visible, "root shortcut should replace the visible file terminal")
vim.cmd.enew()
press(2, 4)
assert(vim.startswith(commands[3], "yazi " .. vim.fn.shellescape(vim.fn.getcwd()) .. " --chooser-file="))
vim.fn.delete(root, "rf")
print("PASS: Yazi file/root targets, toggling, fallback and scheduled input")
