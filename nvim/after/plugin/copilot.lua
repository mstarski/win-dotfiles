vim.cmd([[ imap <silent><script><expr> <Right> copilot#Accept("\<CR>") ]])
vim.cmd([[ let g:copilot_no_tab_map = v:true]])

vim.api.nvim_set_var("copilot_filetypes", {
	["dap-repl"] = false,
	["dapui_watches"] = false,
})
