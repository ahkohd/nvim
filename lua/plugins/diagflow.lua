return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	opts = {
		scope = "line",
		toggle_event = { "InsertEnter", "InsertLeave" },
	},
}
