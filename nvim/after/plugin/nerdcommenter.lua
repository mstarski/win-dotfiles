local api = vim.api

api.nvim_set_var("NERDSpaceDelims", 1)

-- Control + /
api.nvim_set_keymap("n", "<C-_>", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true, silent = true })
api.nvim_set_keymap("v", "<C-_>", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true, silent = true })
