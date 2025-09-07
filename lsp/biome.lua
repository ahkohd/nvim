-- luacheck: globals vim

return {
	cmd = function(dispatchers, config)
		local cmd = "biome"
		local root_dir = (config or {}).root_dir
		if root_dir and type(root_dir) == "string" then
			local local_cmd = root_dir .. "/node_modules/.bin/biome"
			if vim.fn.executable(local_cmd) == 1 then
				cmd = local_cmd
			end
		end
		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
	end,
	filetypes = {
		"astro",
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},
	workspace_required = true,
	root_markers = { "biome.json", "biome.jsonc" },
}
