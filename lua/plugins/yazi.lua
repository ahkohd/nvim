local function focus(term)
	vim.schedule(function()
		if term:win_valid() then
			vim.api.nvim_set_current_win(term.win)
			vim.cmd.startinsert()
		end
	end)
end

local function toggle(root)
	local file = vim.fn.expand("%:p")
	local target = file
	if root then
		target = vim.fs.root(file ~= "" and file or vim.fn.getcwd(), { ".jj", ".git" }) or vim.fn.getcwd()
	elseif vim.fn.filereadable(file) == 0 then
		target = vim.fn.getcwd()
	end
	local command = "yazi " .. vim.fn.shellescape(target) .. " --chooser-file="
	local existing
	for _, term in ipairs(Snacks.terminal.list()) do
		if term:buf_valid() and term.cmd and term.cmd:match("^yazi ") then
			if vim.startswith(term.cmd, command) then
				existing = term
			elseif term:win_valid() then
				term:hide()
			end
		end
	end
	if existing then
		if existing:win_valid() then
			existing:hide()
		else
			existing:show()
			focus(existing)
		end
		return
	end

	local picked = vim.fn.tempname()
	local term = Snacks.terminal.open(command .. vim.fn.shellescape(picked), {
		start_insert = true,
		auto_insert = true,
		auto_close = true,
		win = {
			style = "float",
			border = "none",
			width = 0,
			height = 0,
			row = 0,
			col = 0,
			backdrop = false,
			wo = { winbar = " yazi" },
			on_close = function()
				if vim.fn.filereadable(picked) == 1 then
					local lines = vim.fn.readfile(picked)
					vim.fn.delete(picked)
					if lines[1] and lines[1] ~= "" then
						vim.schedule(function()
							vim.cmd.edit(vim.fn.fnameescape(lines[1]))
						end)
					end
				end
			end,
		},
	})
	if term then
		focus(term)
	end
end

return {
	"folke/snacks.nvim",
	keys = {
		{
			"<leader>o",
			function()
				toggle(false)
			end,
			desc = "Toggle Yazi at file",
			mode = { "n", "t" },
		},
		{
			"<leader>O",
			function()
				toggle(true)
			end,
			desc = "Toggle Yazi at project root",
			mode = { "n", "t" },
		},
	},
}
