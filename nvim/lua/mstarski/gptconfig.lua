local M = {}

function M.chatGptConfig()
	local cfg = {
		api_key_cmd = "gpg -d " .. os.getenv("HOME") .. "/.secrets/openai",

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
			model = "gpt-4-1106-preview",
			max_tokens = 300,
		},

		openai_edit_params = {
			model = "gpt-4-1106-preview",
		},
	}

	return cfg
end

function M.setBindings(chatgpt)
	vim.keymap.set("n", "<leader>0c", chatgpt.openChat)
	vim.keymap.set("n", "<leader>0e", chatgpt.edit_with_instructions)
end

return M
