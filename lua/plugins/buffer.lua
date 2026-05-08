return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = "VeryLazy",
	opts = {
		retirementAgeMins = 10,
		minimumBufferNum = 5,
		ignoredFiletypes = {
			"terminal",
			"float_terminal",
			"snacks_picker",
			"snacks_picker_list",
			"help",
			"qf",
			"undotree",
			"lazy",
			"mason",
			"buffersticks",
			"difft",
		},
	},
}
