--luacheck: globals Difft

return {
	dir = "~/Developer/difft",
	event = "VeryLazy",
	keys = {
		{
			"<leader>d",
			function()
				if Difft.is_visible() then
					Difft.hide()
				else
					Difft.diff()
				end
			end,
			desc = "Toggle Difft",
		},
	},
	config = function()
		require("difft").setup({
			layout = "ivy_taller",
			loading_message = "Diffing...",
			no_diff_message = "All clean! No changes.",
			window = {
				number = false,
				relativenumber = false,
			},
			header = {
				content = function(filename, step)
					local result = {}

					table.insert(result, { filename })
					table.insert(result, { " " })

					if step then
						table.insert(result, { "• " })
						table.insert(result, { tostring(step.current) })
						table.insert(result, { "/" })
						table.insert(result, { tostring(step.of) })
						table.insert(result, { " " })
					end

					return result
				end,
				highlight = {
					full_width = false,
				},
			},
		})
	end,
}
