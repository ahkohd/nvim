-- luacheck: globals vim

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
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
			highlight = {
				enable = true,
			},
		})

		vim.filetype.add({ extension = { mdx = "markdown.mdx" } })

		vim.treesitter.language.register("markdown", "markdown.mdx")

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
