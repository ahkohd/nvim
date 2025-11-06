return {
	"MattesGroeger/vim-bookmarks",
	event = "VeryLazy",
	keys = {
		{ "<leader>bt", "<cmd>BookmarkToggle<cr>", desc = "Toggle bookmark" },
		{ "<leader>ba", "<cmd>BookmarkAnnotate<cr>", desc = "Annotate bookmark" },
		{ "<leader>bn", "<cmd>BookmarkNext<cr>", desc = "Next bookmark" },
		{ "<leader>bp", "<cmd>BookmarkPrev<cr>", desc = "Previous bookmark" },
		{ "<leader>bl", "<cmd>BookmarkShowAll<cr>", desc = "List all bookmarks" },
		{ "<leader>bc", "<cmd>BookmarkClear<cr>", desc = "Clear bookmarks in buffer" },
		{ "<leader>bx", "<cmd>BookmarkClearAll<cr>", desc = "Clear all bookmarks" },
		{ "<leader>bk", "<cmd>BookmarkMoveUp<cr>", desc = "Move bookmark up" },
		{ "<leader>bj", "<cmd>BookmarkMoveDown<cr>", desc = "Move bookmark down" },
		{ "<leader>bg", "<cmd>BookmarkMoveToLine<cr>", desc = "Move bookmark to line" },
		{ "<leader>bs", "<cmd>BookmarkSave<cr>", desc = "Save bookmarks" },
		{ "<leader>bo", "<cmd>BookmarkLoad<cr>", desc = "Load bookmarks" },
	},
}
