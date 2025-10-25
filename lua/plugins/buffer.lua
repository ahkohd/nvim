return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = "VeryLazy",
  opts = {
    retirementAgeMins = 5,
    minimumBufferNum = 4,
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
      "difft"
    }
  }
}
