local copilot = require("copilot")
local suggestion = require("copilot.suggestion")

copilot.setup()

-- Keybindings
vim.keymap.set("i", "<Right>", suggestion.accept, { noremap = false })
