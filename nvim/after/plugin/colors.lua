-- ********* ROSEPINE *********
--
-- require("rose-pine").setup({
-- --- @usage 'auto'|'main'|'moon'|'dawn'
-- variant = "auto",
-- --- @usage 'main'|'moon'|'dawn'
-- dark_variant = "moon",
-- bold_vert_split = false,
-- dim_nc_background = false,
-- disable_background = false,
-- disable_float_background = false,
-- disable_italics = false,

-- --- @usage string hex value or named color from rosepinetheme.com/palette
-- groups = {
-- background = "base",
-- background_nc = "_experimental_nc",
-- panel = "surface",
-- panel_nc = "base",
-- border = "highlight_med",
-- comment = "muted",
-- link = "iris",
-- punctuation = "subtle",

-- error = "love",
-- hint = "iris",
-- info = "foam",
-- warn = "gold",

-- headings = {
-- h1 = "iris",
-- h2 = "foam",
-- h3 = "rose",
-- h4 = "gold",
-- h5 = "pine",
-- h6 = "foam",
-- },
-- -- or set all headings at once
-- -- headings = 'subtle'
-- },

-- -- Change specific vim highlight groups
-- -- https://github.com/rose-pine/neovim/wiki/Recipes
-- highlight_groups = {
-- ColorColumn = { bg = "rose" },

-- -- Blend colours against the "base" background
-- CursorLine = { bg = "foam", blend = 10 },
-- StatusLine = { fg = "love", bg = "love", blend = 10 },

-- TelescopeBorder = { fg = "highlight_high", bg = "none" },
-- TelescopeNormal = { bg = "none" },
-- TelescopePromptNormal = { bg = "base" },
-- TelescopeResultsNormal = { fg = "subtle", bg = "none" },
-- TelescopeSelection = { fg = "text", bg = "base" },
-- TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
-- },
-- })

-- -- Set colorscheme after options
-- vim.cmd("colorscheme rose-pine")

-- ********* DARCULA *********
-- vim.cmd("colorscheme darcula")

-- ********* GRUVBOX *********
-- require("gruvbox").setup({
-- italic = {
-- strings = false,
-- emphasis = false,
-- comments = false,
-- operators = false,
-- fold = false,
-- },
-- contrast = "hard",
-- transparent_mode = true,
-- })
--
-- vim.cmd("colorscheme gruvbox")

-- ********* CATPUCCIN *********
require("catppuccin").setup({
	flavour = "macchiato",
	no_italic = true,
})

vim.cmd("colorscheme catppuccin")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
