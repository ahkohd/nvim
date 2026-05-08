return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local parsers = {
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
		}

		require("nvim-treesitter").install(parsers)

		vim.filetype.add({ extension = { mdx = "markdown.mdx" } })
		vim.treesitter.language.register("markdown", "markdown.mdx")

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
				if lang and pcall(vim.treesitter.start, ev.buf, lang) then
					vim.bo[ev.buf].syntax = "ON"
				end
			end,
		})
	end,
}
