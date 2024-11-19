-- luacheck: globals vim
--
vim.g.toggle_statusline = false

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	event = "BufReadPost",
	key = {
		{
			"<space>e",
			function()
				local lualine = require("lualine")

				if vim.g.toggle_statusline then
					vim.g.toggle_statusline = false
					lualine.hide({
						place = { "statusline" },
						unhide = false,
					})
				else
					vim.g.toggle_statusline = true
					lualine.hide({ unhide = true })
				end
			end,
			desc = "Toggle statusline",
		},
	},
	config = function()
		local icons = require("core.ui.icons")

		local disable = {
			"netrw",
			"lazy",
			"lazygit",
		}

		local ignore = { "help", "TelescopePrompt" }

		local function hide_in_width()
			return vim.fn.winwidth(0) > 80
		end

		local diff = {
			"diff",
			colored = false,
			cond = hide_in_width,
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = false,
			cond = hide_in_width,
		}

		local branch = {
			"branch",
			icon = icons.git,
		}

		local function lsp_client_names()
			local clients = vim.lsp.get_active_clients()

			if next(clients) == nil then
				return ""
			end

			local client_names = {}

			for _, client in pairs(clients) do
				table.insert(client_names, client.name)
			end

			return table.concat(client_names, ", ")
		end

		local language_server = {
			lsp_client_names,
		}

		local lsp_progress = {
			"lsp_progress",
			display_components = { { "title", "percentage", "message" } },
			timer = {
				progress_enddelay = 500,
				lsp_client_name_enddelay = 500,
			},
		}

		local opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = disable,
				ignore_focus = ignore,
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { filetype, "filename" },
				lualine_b = { branch },
				lualine_c = { diff },
				lualine_x = { lsp_progress, language_server },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = {},
		}

		local lualine = require("lualine")

		lualine.setup(opts)

		if not vim.g.toggle_statusline then
			lualine.hide({
				place = { "statusline" },
				unhide = false,
			})
		end
	end,
}
