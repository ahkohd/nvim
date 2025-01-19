-- luacheck: globals vim

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		if not vim.g.loaded_nvim_treesitter then
			vim.cmd([[echom "Not loaded treesitter"]])
			return
		end

		require("nvim-treesitter.configs").setup({
			modules = {},
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			ensure_installed = {
				"tsx",
				"typescript",
				"javascript",
				"toml",
				"json",
				"yaml",
				"html",
				"css",
				"scss",
				"rust",
				"lua",
				"gitignore",
				"markdown",
				"markdown_inline",
				"nix",
				"astro",
				"zig",
			},
			autotag = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-CR>",
					node_incremental = "<C-CR>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			textobjects = {
				select = {
					enable = false,
				},
			},
		})

		vim.filetype.add({ extension = { mdx = "markdown.mdx" } })

		vim.treesitter.language.register("markdown", "markdown.mdx")

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
