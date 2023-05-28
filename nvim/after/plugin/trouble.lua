require("trouble").setup()

vim.keymap.set("n", "<leader><BS>", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
