-- luacheck: globals Snacks vim

local float_win = {
	style = "float",
	border = "none",
	width = 0,
	height = 0,
	row = 0,
	col = 0,
	backdrop = false,
}

local function find_term(match)
	for _, term in ipairs(Snacks.terminal.list()) do
		if term:buf_valid() and match(term) then
			return term
		end
	end
end

local function toggle(cmd, label)
	return function()
		local self = find_term(function(t)
			return t.cmd == cmd
		end)
		if self and self:win_valid() then
			self:hide()
			return
		end
		for _, term in ipairs(Snacks.terminal.list()) do
			if term:win_valid() then
				term:hide()
			end
		end
		local term = Snacks.terminal.toggle(cmd, {
			start_insert = true,
			auto_insert = true,
			win = vim.tbl_deep_extend("force", float_win, {
				wo = { winbar = " " .. (label or cmd) },
			}),
		})
		if term and term:win_valid() then
			vim.schedule(function()
				vim.api.nvim_set_current_win(term.win)
				vim.cmd.startinsert()
			end)
		end
	end
end

local function toggle_yazi()
	local self = find_term(function(t)
		return t.cmd and t.cmd:match("^yazi")
	end)
	if self and self:win_valid() then
		self:hide()
		return
	end
	for _, term in ipairs(Snacks.terminal.list()) do
		if term:win_valid() then
			term:hide()
		end
	end
	if self then
		self:show()
		vim.schedule(function()
			vim.api.nvim_set_current_win(self.win)
			vim.cmd.startinsert()
		end)
		return
	end

	local picked = vim.fn.tempname()
	local target = vim.fn.expand("%:p")
	if target == "" or vim.fn.filereadable(target) == 0 then
		target = vim.fn.getcwd()
	end
	local cmd = string.format("yazi %s --chooser-file=%s", vim.fn.shellescape(target), vim.fn.shellescape(picked))

	local term = Snacks.terminal.open(cmd, {
		start_insert = true,
		auto_insert = true,
		auto_close = true,
		win = vim.tbl_deep_extend("force", float_win, {
			wo = { winbar = " yazi" },
			on_close = function()
				if vim.fn.filereadable(picked) == 1 then
					local lines = vim.fn.readfile(picked)
					vim.fn.delete(picked)
					if lines and lines[1] and lines[1] ~= "" then
						vim.schedule(function()
							vim.cmd.edit(vim.fn.fnameescape(lines[1]))
						end)
					end
				end
			end,
		}),
	})

	if term and term:win_valid() then
		vim.schedule(function()
			vim.api.nvim_set_current_win(term.win)
			vim.cmd.startinsert()
		end)
	end
end

local function hide_current()
	for _, term in ipairs(Snacks.terminal.list()) do
		if term:win_valid() then
			term:hide()
		end
	end
end

return {
	"folke/snacks.nvim",
	keys = {
		{ ";r", toggle("mprocs", "mprocs"), desc = "Toggle Task Runner", mode = { "n", "t" } },
		{ ";d", toggle("oy view", "oy view"), desc = "Toggle oy view", mode = { "n", "t" } },
		{ ";f", toggle_yazi, desc = "Toggle Yazi", mode = { "n", "t" } },
		{ ";a", toggle("pi", "pi"), desc = "Toggle pi", mode = { "n", "t" } },
		{ ";j", toggle(vim.o.shell, "shell"), desc = "Toggle shell", mode = { "n", "t" } },
		{ ";s", toggle("SHELL_INSTANCE=2 " .. vim.o.shell, "shell 2"), desc = "Toggle shell 2", mode = { "n", "t" } },
		{ ";<esc>", hide_current, desc = "Hide terminal", mode = { "n", "t" } },
		{ ";q", hide_current, desc = "Hide terminal", mode = { "n", "t" } },
	},
}
