local resession = require("resession")

resession.setup({
	autosave = {
		enabled = true,
		-- How often to save (in seconds)
		interval = 60,
	},
})

vim.keymap.set("n", "<leader>ss", resession.save)
vim.keymap.set("n", "<leader>sl", resession.load)
vim.keymap.set("n", "<leader>sd", resession.delete)

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		-- Always save a special session named "last"
		resession.save("last")
	end,
})
