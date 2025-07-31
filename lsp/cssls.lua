return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	init_options = {
		provideFormatter = true,
	},
	root_markers = { '.git', '.jj' },
	single_file_support = true,
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "warning",
			},
		},
		scss = {
			validate = true,
		},
		less = {
			validate = true,
		},
	},
}
