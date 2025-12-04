return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local map = vim.keymap.set
		map("n", "-f", "<cmd>FzfLua files<cr>")
		map("n", "-b", "<cmd>FzfLua buffers<cr>")
	end,
}
