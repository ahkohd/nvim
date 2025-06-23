-- luacheck: globals vim

return {
	-- Auto-load bacon locations for Rust files
	{
		dir = vim.fn.stdpath("config"),
		name = "rust-bacon-autoload",
		event = { "BufReadPost *.rs", "BufNewFile *.rs", "BufWritePost *.rs" },
		keys = {
			{
				"<leader>lb",
				function()
					if _G.bacon_load_locations then
						_G.bacon_load_locations()
					end
				end,
				desc = "Bacon locations to location list",
			},
		},
		config = function()
			local group = vim.api.nvim_create_augroup("RustBaconAutoload", { clear = true })

			-- Store watchers at the script level to prevent GC
			local watchers = {}

			-- Find and load .bacon-locations file into location list
			local load_bacon_locations = function()
				local current_dir = vim.fn.expand("%:p:h")

				-- Find .bacon-locations file from current directory upward
				local found = vim.fs.find(".bacon-locations", {
					upward = true,
					path = current_dir,
					limit = 1,
				})[1]

				if found then
					-- Get the directory containing the bacon file
					local bacon_dir = vim.fs.dirname(found)

					-- Make it async using vim.schedule
					vim.schedule(function()
						-- Read the file line by line
						local lines = vim.fn.readfile(found)
						local qf_items = {}

						for _, line in ipairs(lines) do
							-- Parse format: path:line:col message
							-- Example: src/lib.rs:187:13 unused variable: `something_random__`
							local path, lnum, col, message = line:match("^(.+):(%d+):(%d+)%s+(.*)$")
							if path and lnum and col then
								-- Build absolute path
								local full_path = bacon_dir .. "/" .. path
								table.insert(qf_items, {
									filename = full_path,
									lnum = tonumber(lnum),
									col = tonumber(col),
									text = message,
								})
							end
						end

						-- Set the location list for current window
						vim.fn.setloclist(0, qf_items)
						local count = #qf_items

						require("fidget").notify(string.format("Loaded %d items from: %s", count, found))
					end)
				else
					require("fidget").notify("No .bacon-locations file found", vim.log.levels.WARN)
				end
			end

			-- Store function globally for keymap access
			_G.bacon_load_locations = load_bacon_locations

			-- Function to find and watch bacon-locations file
			local function setup_bacon_watcher(bufnr)
				local current_dir = vim.fn.expand("%:p:h")
				local found = vim.fs.find(".bacon-locations", {
					upward = true,
					path = current_dir,
					limit = 1,
				})[1]

				if found then
					-- Clean up any existing watcher for this buffer
					if watchers[bufnr] then
						watchers[bufnr]:stop()
						watchers[bufnr] = nil
					end

					-- Watch the bacon-locations file for changes
					local w = vim.loop.new_fs_event()
					if w then
						local success = w:start(found, {}, function()
							-- Schedule the callback to run in the main loop
							vim.schedule(function()
								-- Debounce: wait a bit for bacon to finish writing
								vim.defer_fn(function()
									load_bacon_locations()
								end, 500)
							end)
						end)

						if success then
							-- Store watcher to prevent garbage collection
							watchers[bufnr] = w
						else
							w:stop()
						end
					end
				end
			end

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePost" }, {
				pattern = "*.rs",
				group = group,
				callback = function(args)
					-- Initial load
					vim.defer_fn(function()
						load_bacon_locations()
						setup_bacon_watcher(args.buf)
					end, 100)
				end,
				desc = "Auto-load bacon locations for Rust files",
			})

			-- Clean up watcher when leaving or deleting buffer
			vim.api.nvim_create_autocmd({ "BufLeave", "BufDelete" }, {
				pattern = "*.rs",
				group = group,
				callback = function(args)
					if watchers[args.buf] then
						watchers[args.buf]:stop()
						watchers[args.buf] = nil
					end
				end,
			})
		end,
	},
}
