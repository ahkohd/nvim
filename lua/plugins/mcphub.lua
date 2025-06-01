return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "npm install -g mcp-hub@latest",
	cmd = { "MCPHub", "CodeCompanion" },
	config = function()
		require("mcphub").setup()
	end,
}
