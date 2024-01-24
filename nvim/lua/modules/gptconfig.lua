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
				width = "90%",
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
			max_tokens = 1000,
			temperature = 0.6,
			top_p = 0.7,
		},

		openai_edit_params = {
			model = "gpt-4-1106-preview",
			temperature = 0.2,
			top_p = 0.1,
		},
	}

	return cfg
end

return M
