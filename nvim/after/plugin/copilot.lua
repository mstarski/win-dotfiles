local env = require("mstarski.env")

if env.aiCompletion == "copilot" then
	vim.cmd([[ imap <silent><script><expr> <Tab> copilot#Accept("\<CR>") ]])

	vim.g.copilot_node_command = os.getenv("HOME") .. "/.nvm/versions/node/v20.9.0/bin/node"
	vim.g.copilot_no_tab_map = true

	vim.api.nvim_set_var("copilot_filetypes", {
		["dap-repl"] = false,
		["dapui_watches"] = false,
	})

	require("CopilotChat").setup()
end
