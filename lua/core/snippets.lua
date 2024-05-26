local M = {}

M.load = function()
	local ls = require("luasnip")

	local snip = ls.snippet
	local func = ls.function_node

	local date = function()
		return { os.date() }
	end

	local ymd = function()
		return { os.date("%Y-%m-%d") }
	end

	local time = function()
		return { os.date("%I:%M") }
	end

	local epoch = function()
		return { tostring(os.time()) }
	end

	ls.add_snippets(nil, {
		all = {
			snip({
				trig = "name",
				namr = "Name",
				dscr = "My name",
			}, {
				func(function()
					return "Victor Aremu"
				end, {}),
			}),
			snip({
				trig = "date",
				namr = "Date",
				dscr = "Get today's date",
			}, {
				func(date, {}),
			}),
			snip({
				trig = "ymd",
				namr = "Ymd",
				dscr = "Date in the form of YYYY-MM-DD",
			}, {
				func(ymd, {}),
			}),
			snip({
				trig = "time",
				namr = "time",
				dscr = "Get the current time I:M",
			}, {
				func(time, {}),
			}),
			snip({
				trig = "epoch",
				namr = "Epoch",
				dscr = "Get the current timestamp",
			}, {
				func(epoch, {}),
			}),
		},
	})
end

return M
