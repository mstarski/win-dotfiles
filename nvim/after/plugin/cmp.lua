local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("lsp-zero").cmp_action()

local border_opts = {
	border = "single",
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

local function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	sources = {
		-- Copilot Source
		{ name = "copilot" },

		-- Other sources
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	},
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			symbol_map = {
				Text = " (text)",
				Method = " (method)",
				Function = " (function)",
				Constructor = " (constructor)",
				Field = "ﰠ (field)",
				Variable = " (var)",
				Class = "ﴯ (class)",
				Interface = " (interface)",
				Module = " (module)",
				Property = "ﰠ (property)",
				Unit = "塞(unit)",
				Value = " (value)",
				Enum = " (enum)",
				Keyword = " (keyword)",
				Snippet = " (snippet)",
				Color = " (color)",
				File = " (file)",
				Reference = " (reference)",
				Filder = " (folder)",
				EnumMember = " (enum-member)",
				Constant = " (constant)",
				Struct = "פּ (struct)",
				Event = " (event)",
				Operator = " (operator)",
				TypeParameter = "(type-param)",
			},

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(_, vim_item)
				return vim_item
			end,
		}),
	},
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#FA31A7" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FF7F50" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#00FFF9" })
