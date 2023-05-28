local dashboard = require("alpha.themes.dashboard")
dashboard.config.opts.noautocmd = true

dashboard.section.buttons.val = {
	dashboard.button("q", "  New File  ", ":ene <BAR> startinsert<CR>"),
	dashboard.button("w", "  Find File  ", ":Telescope find_files<CR>"),
	dashboard.button("e", "󰈙  Recents  ", "[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]]"),
	dashboard.button("r", "󰈭  Find Word  ", ":Telescope live_grep<CR>"),
	dashboard.button("t", "  Bookmarks  "),
	dashboard.button("y", "  Last Session  "),
}

require("alpha").setup(dashboard.config)
