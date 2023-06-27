local copilot = require("copilot")
local suggestion = require("copilot.suggestion")

copilot.setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
	},
})

-- Keybindings
vim.keymap.set("i", "<Right>", suggestion.accept, { noremap = false })
