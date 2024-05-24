-- luacheck: globals vim

return {
	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			local headers = require("core.ui.alpha.headers")
			local quotes = require("core.ui.alpha.quotes")
			local theme = require("alpha.themes.theta")
			local path_ok = pcall(require, "plenary.path")
			if not path_ok then
				return
			end

			math.randomseed(os.time())

			local function apply_gradient_hl(text)
				-- no clown fiesta
				-- local gradient = require("core.ui.alpha.utils").create_gradient("#E1E1E1", "#202020", #text)
				-- embark
				local gradient = require("core.ui.alpha.utils").create_gradient("#91ddff", "#cbe3e7", #text)

				local lines = {}
				for i, line in ipairs(text) do
					local tbl = {
						type = "text",
						val = line,
						opts = {
							hl = "HeaderGradient" .. i,
							shrink_margin = false,
							position = "center",
						},
					}
					table.insert(lines, tbl)

					-- create hl group
					vim.api.nvim_set_hl(0, "HeaderGradient" .. i, { fg = gradient[i] })
				end

				return {
					type = "group",
					val = lines,
					opts = { position = "center" },
				}
			end

			local function get_header(list)
				local header_text = list[math.random(#list)]
				return apply_gradient_hl(header_text)
			end

			-- Footer
			local function get_footer(list, width)
				local quote_text = list[math.random(#list)]

				local max_width = width or 35

				local tbl = {}
				for _, text in ipairs(quote_text) do
					local padded_text = require("core.ui.alpha.utils").pad_string(text, max_width, "right")
					table.insert(
						tbl,
						{ type = "text", val = padded_text, opts = { hl = "Comment", position = "center" } }
					)
				end

				return {
					type = "group",
					val = tbl,
					opts = {},
				}
			end

			local dashboard = require("alpha.themes.dashboard")

			-- Links / tools
			local function get_tools()
				local tbl = {
					{ type = "text", val = "˶ᵔ ᵕ ᵔ˶", opts = { hl = "SpecialComment", position = "center" } },
					{
						type = "group",
						val = {
							dashboard.button("f", " Telescope", "<cmd>Telescope<CR>"),
							dashboard.button(
								"o",
								" Take notes",
								"<cmd>lua require('core.utils.obsidian').open()<CR>"
							),
							dashboard.button("l", " Extensions...", "<cmd>Lazy<CR>"),
							dashboard.button("m", " Packages...", "<cmd>Mason<CR>"),
							dashboard.button("q", " Quit", "<cmd>qa!<CR>"),
						},
						position = "center",
					},
				}
				return { type = "group", val = tbl, opts = {} }
			end

			-- MRU
			local function get_mru(max_shown)
				local tbl = {
					{ type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
				}

				local mru_list = theme.mru(1, "", max_shown)
				for _, file in ipairs(mru_list.val) do
					table.insert(tbl, file)
				end

				return { type = "group", val = tbl, opts = {} }
			end

			-- Layout
			theme.config.layout = {
				{ type = "padding", val = 4 },
				get_header({ headers.neovim, headers.opa, headers.cat }),
				{ type = "padding", val = 1 },
				get_tools(),
				{ type = "padding", val = 2 },
				get_mru(4),
				{ type = "padding", val = 3 },
				get_footer({ quotes.yoda }, 50),
			}

			-- Function to disable lualine
			local function disable_lualine()
				vim.g.lualine_active = false
				require("lualine").refresh()
			end

			-- Function to enable lualine
			local function enable_lualine()
				vim.g.lualine_active = true
				require("lualine").refresh()
			end

			-- Autocmd to disable lualine on entering Alpha dashboard
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "alpha",
				callback = disable_lualine,
			})

			-- Autocmd to enable lualine on leaving Alpha dashboard
			vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
				pattern = "*",
				callback = enable_lualine,
			})

			require("alpha").setup(theme.config)
		end,
	},
}
