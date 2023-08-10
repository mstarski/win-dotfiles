local telescope = require("telescope.builtin")

vim.api.nvim_set_keymap("n", "<leader><CR>", ":G ", { noremap = true })

vim.keymap.set("n", "<leader>gs", ":vert G<CR>", { silent = true })

-- Toggle branches
vim.keymap.set("n", "<M-b>", function()
	telescope.git_branches()
end)

vim.keymap.set("n", "<leader>gl", telescope.git_commits)

vim.keymap.set("n", "<leader>9", telescope.git_stash)

-- Resolving conflicts
vim.keymap.set("n", "<leader>g[", function()
	vim.cmd("diffget //2")
end)

vim.keymap.set("n", "<leader>g]", function()
	vim.cmd("diffget //3")
end)
