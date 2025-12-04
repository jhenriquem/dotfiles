local o, opt = vim.o, vim.opt

vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

opt.guicursor = {
	"n-sm:block",
	"v:hor50",
	"c-ci-cr-i-ve:ver10",
	"o-r:hor10",
	"a:Cursor/Cursor-blinkwait1-blinkon1-blinkoff1",
}

opt.tabstop = 2
opt.undofile = true

o.signcolumn = "yes:2"

opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.shiftround = true

--Ntree
vim.g.netrw_liststyle = 3
vim.g.netrw_sort_by = "size"

opt.laststatus = 0
o.linebreak = true
opt.scrolloff = 10
o.shortmess = "acstFOSW"
o.gdefault = true
o.inccommand = "split"

o.wrap = true
o.breakindent = true
o.smartindent = true

o.cmdheight = 0
