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
		max_line_length = 80,
	},

	popup_layout = {
		default = "center",
		center = {
			width = "60%",
			height = "90%",
		},
	},

	popup_input = {
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top_align = "center",
				top = "🤖 What would you like to know?",
			},
		},
	},

	openai_params = {
		model = "gpt-3.5-turbo",
		max_tokens = 300,
	},

	openai_edit_params = {
		model = "code-davinci-edit-001",
	},
})

vim.keymap.set("n", "<leader>0c", chatgpt.openChat)
vim.keymap.set("n", "<leader>0e", chatgpt.edit_with_instructions)
