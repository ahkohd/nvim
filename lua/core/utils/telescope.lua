-- luacheck: globals vim

local M = {}

M.document_symbols_for_selected = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local actions = require("telescope.actions")
	local entry = action_state.get_selected_entry()

	if entry == nil then
		print("No file selected")
		return
	end

	actions.close(prompt_bufnr)

	vim.schedule(function()
		local bufnr = vim.fn.bufadd(entry.path)
		vim.fn.bufload(bufnr)

		local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }
		vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", params, function(err, result, _, _)
			if err then
				print("Error getting document symbols: " .. vim.inspect(err))
				return
			end

			if not result or vim.tbl_isempty(result) then
				print("No symbols found")
				return
			end

			local function flatten_symbols(symbols, parent_name)
				local flattened = {}

				for _, symbol in ipairs(symbols) do
					local name = symbol.name
					if parent_name then
						name = parent_name .. "." .. name
					end
					table.insert(flattened, {
						name = name,
						kind = symbol.kind,
						range = symbol.range,
						selectionRange = symbol.selectionRange,
					})
					if symbol.children then
						local children = flatten_symbols(symbol.children, name)
						for _, child in ipairs(children) do
							table.insert(flattened, child)
						end
					end
				end
				return flattened
			end

			local flat_symbols = flatten_symbols(result)

			-- Define highlight group for symbol kind
			vim.cmd([[highlight TelescopeSymbolKind guifg=#61AFEF]])

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Document Symbols: " .. vim.fn.fnamemodify(entry.path, ":t"),
					finder = require("telescope.finders").new_table({
						results = flat_symbols,
						entry_maker = function(symbol)
							local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Other"

							return {
								value = symbol,
								display = function(entry)
									local display_text = string.format("%-50s %s", entry.value.name, kind)
									return display_text,
										{ { { #entry.value.name + 1, #display_text }, "TelescopeSymbolKind" } }
								end,
								ordinal = symbol.name,
								filename = entry.path,
								lnum = symbol.selectionRange.start.line + 1,
								col = symbol.selectionRange.start.character + 1,
							}
						end,
					}),
					sorter = require("telescope.config").values.generic_sorter({}),
					previewer = require("telescope.config").values.qflist_previewer({}),
					attach_mappings = function(_, map)
						map("i", "<CR>", function(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							vim.cmd("edit " .. selection.filename)
							vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col - 1 })
						end)
						return true
					end,
				})
				:find()
		end)
	end)
end

return M
