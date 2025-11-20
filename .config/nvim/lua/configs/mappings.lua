local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Diagnostic
map("n", "-d", "<cmd> lua vim.diagnostic.setloclist()<CR>")

-- Fuzzy
map("n", "-f", ":find ./**/") -- files
map("n", "-\\", ":buffer ") -- buffers

-- Ntree
map("n", "<space>b", "<cmd>Ex %:p:h<CR>")

-- Buffers
map("n", "<space>n", ":bnext<CR>", opts)
map("n", "<space>p", ":bprev<CR>", opts)
map("n", "<space>x", ":bdelete<CR>", opts)

-- Movement
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Disable highlight in search [:/ ...]
map("n", "<ESC>", ":noh<cr>", { desc = "Disable highlight in search", silent = true })

-- ESC
map("i", "lk", "<ESC>")

-- LSP
map("n", "K", vim.lsp.buf.hover)

-- Movement in window
map("n", "<space>l", "<C-w>l")
map("n", "<space>h", "<C-w>h")
map("n", "<space>j", "<C-w>j")
map("n", "<space>k", "<C-w>k")

map("i", "<a-,>", "$")
map("i", "<a-.>", "&")
map("i", "<a-;>", "#")
map("i", ";;", "*")
map("i", ",,", "%")

map("i", "[[", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	if col >= #line or line:sub(col + 1, col + 1):match("%s") then
		vim.api.nvim_set_current_line(line:sub(1, col) .. "()" .. line:sub(col + 1))
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	else
		vim.api.nvim_set_current_line(line:sub(1, col) .. "(" .. line:sub(col + 1))
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end)

map("i", "]]", ")")

-- map("i", "", ""<Left>")
map("i", "<a-[>", '""<Left>')

-- Select and copy
map("n", "<C-a>", "gg<S-v>G")
map("v", "<c-y>", '"+y')

-- Panes
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)

-- Resize window
map("n", "<C-right>", "<C-w><")
map("n", "<C-left>", "<C-w>>")
map("n", "<C-up>", "<C-w>+")
map("n", "<C-down>", "<C-w>-")
