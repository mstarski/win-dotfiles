local env = require("mstarski.env")

if env.aiCompletion == "tabnine" then
	require("tabnine").setup({
		disable_auto_comment = true,
		accept_keymap = "<Right>",
		dismiss_keymap = "<C-]>",
		debounce_ms = 400,
		suggestion_color = { gui = "#808080", cterm = 244 },
		exclude_filetypes = { "TelescopePrompt", "NvimTree" },
		log_file_path = nil, -- absolute path to Tabnine log file
	})
end
