-- Shift + y copies entire line instead of copying everything after cursor
vim.keymap.set("n", "Y", "Vy")

-- Move lines up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Keep cursor in the middle while scrolling with C-d & C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>y for yanking into system clipboard
vim.keymap.set("", "<leader>y", [["+y]])
vim.keymap.set("", "<leader>Y", [["+Y]])

-- Disable arrows
vim.keymap.set("n", "<UP>", "<nop>")
vim.keymap.set("n", "<DOWN>", "<nop>")
vim.keymap.set("n", "<LEFT>", "<nop>")
vim.keymap.set("n", "<RIGHT>", "<nop>")

-- Splits
vim.keymap.set("", "<leader>\\", ":vs<CR> :wincmd l<CR>")
vim.keymap.set("", "<leader>'", ":sv<CR> :wincmd j<CR>")

-- Close buffers
vim.keymap.set("n", "<M-q>", ":Bwipeout<CR>")

-- Resizing windows
vim.keymap.set("n", "+", ":vertical res +5<CR>")
vim.keymap.set("n", "=", ":vertical res -5<CR>")

vim.keymap.set("n", "_", ":res +5<CR>")
vim.keymap.set("n", "-", ":res -5<CR>")
