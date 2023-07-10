-- Shift + y copies entire line instead of copying everything after cursor
vim.keymap.set("n", "Y", "Vy")

-- Move lines up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Keep cursor in the middle while scrolling with C-d & C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>y for yanking into system clipboard
vim.keymap.set("", "<leader>y", [["+y]])
vim.keymap.set("", "<leader>Y", [["+Y]])

-- Don't copy when pasting
vim.keymap.set("x", "p", [["_dP]])

-- Arrows resize buffers
vim.keymap.set("n", "<UP>", function()
	vim.cmd("resize +5")
end)

vim.keymap.set("n", "<DOWN>", function()
	vim.cmd("resize -5")
end)

vim.keymap.set("n", "<LEFT>", function()
	vim.cmd("vertical resize +5")
end)

vim.keymap.set("n", "<RIGHT>", function()
	vim.cmd("vertical resize -5")
end)

-- Splits
vim.keymap.set("", "<leader>\\", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
end)

vim.keymap.set("", "<leader>'", function()
	vim.cmd("split")
	vim.cmd("wincmd j")
end)

-- Close buffers
vim.keymap.set("n", "<M-q>", ":Bwipeout<CR>", { silent = true })

-- Open command line without shift
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", "<nop>")

vim.keymap.set("n", "`", vim.cmd.q, { silent = true })
