--luacheck: globals vim

return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
		{ "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
		{ "*", [[*<Cmd>lua require('hlslens').start()<CR>]] },
		{ "#", [[#<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]] },
		{ "<leader>n", "<Cmd>noh<CR>" },
	},
	opts = {
		override_lens = function(render, posList, nearest, idx)
			if nearest then
				local text = ("%d/%d"):format(idx, #posList)
				render.setVirt(0, posList[idx][1] - 1, posList[idx][2] - 1, { { " " }, { text, "Comment" } }, nearest)
			end
		end,
	},
}
