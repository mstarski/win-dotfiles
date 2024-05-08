local lualine = require("lualine")

lualine.setup({
	theme = "vscode",
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{
				"branch",
				icon = "",
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
			},
			"diagnostics",
		},
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
			"tabnine",
		},
	},
})
