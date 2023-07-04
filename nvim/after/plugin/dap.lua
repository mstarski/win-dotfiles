local dap = require("dap")
local dapui = require("dapui")
local dap_js = require("dap-vscode-js")
local utils = require("dap.utils")

dap_js.setup({
	adapters = { "pwa-node", "pwa-chrome" },
})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = utils.pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			runtimeExecutable = "npm",
			runtimeArgs = {
				"test",
				"--",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>dt", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dx", function()
	require("dap").terminate()
end)

vim.keymap.set("n", "<leader>dR", function()
	require("dap").run_to_cursor()
end)

vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end)

vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
end)

vim.keymap.set("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)

vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end)

vim.keymap.set("n", "<leader>do", function()
	require("dap").step_over()
end)

vim.keymap.set("n", "<leader>dq", function()
	require("dap").close()
end)

vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.toggle()
end)
