local dashboard = require("alpha.themes.dashboard")
dashboard.config.opts.noautocmd = true

-- https://texteditor.com/multiline-text-art/
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

dashboard.section.buttons.val = {
	dashboard.button("q", "  > Last Session  ", ":lua require('resession').load('last')<CR>"),
	dashboard.button("w", "  > New File  ", ":ene <BAR> startinsert<CR>"),
	dashboard.button("e", "  > Find File  ", ":Telescope find_files<CR>"),
	dashboard.button("r", "󰈙  > Recents  ", "[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]]"),
	dashboard.button("t", "󰈭  > Find Word  ", ":Telescope live_grep<CR>"),
	dashboard.button("y", "  > Bookmarks  "),
}

require("alpha").setup(dashboard.config)
