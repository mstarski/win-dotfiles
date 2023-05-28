local fmtGroup = vim.api.nvim_create_augroup("fmtGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "silent! undojoin | silent! Neoformat",
	group = fmtGroup,
})
