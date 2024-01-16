require("gitmoji").setup({
	opts = {
		filetypes = { "gitcommit" },
		completion = {
			append_space = false,
			complete_as = "emoji",
		},
	},
})
