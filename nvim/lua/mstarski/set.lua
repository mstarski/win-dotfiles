vim.g.mapleader = " "

vim.opt.mouse = "" -- disable mouse

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- I don't want backups but I want undotree to be able to look
-- at the older history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

vim.g.nottimeout = true
vim.opt.ttimeoutlen = 5

vim.cmd([[set formatoptions-=cro]])
vim.cmd([[set shortmess+=FW]])

vim.opt.cmdheight = 0

-- Global statusline
vim.opt.laststatus = 3

vim.opt.cursorline = true
