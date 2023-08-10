local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-dotnet")({
			dap = { justMyCode = false },
		}),
		require("neotest-jest"),
	},
})

vim.keymap.set("n", "<leader>tr", function()
	neotest.run.run()
end)

vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ last_run = true, enter = true })
end)

vim.keymap.set("n", "<leader>tp", function()
	neotest.output_panel.toggle()
end)

vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end)

vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end)

vim.keymap.set("n", "<leader>tw", function()
	neotest.watch.toggle()
end)
