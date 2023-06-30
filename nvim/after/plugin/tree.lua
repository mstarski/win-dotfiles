local api = require("nvim-tree.api")

-- disable netrw at the very start of your init.lua (strongly advised) vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
	on_attach = function(buffer)
		api.config.mappings.default_on_attach(buffer)
	end,
})

vim.keymap.set("n", "<C-b>", function()
	vim.cmd("NvimTreeFindFileToggle")
end)
