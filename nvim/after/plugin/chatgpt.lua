-- Check if ~/.secrets/openapi file exists
local home = vim.fn.expand("$HOME")

if vim.fn.filereadable(home .. "/.secrets/openapi") == 0 then
	return
end

local chatgpt = require("chatgpt")

chatgpt.setup({
	api_key_cmd = "gpg -d " .. os.getenv("HOME") .. "/.secrets/openapi",

	edit_with_instructions = {
		keymaps = {
			use_output_as_input = "<leader>0i",
		},
	},

	chat = {
		question_sign = "🙋 ",
		answer_sign = "🤖 ",
	},

	popup_layout = {
		default = "center",
	},
})

vim.keymap.set("n", "<leader>0c", chatgpt.openChat)
vim.keymap.set("n", "<leader>0e", chatgpt.edit_with_instructions)
