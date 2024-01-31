local _M = {}

function _M.setup_cmp()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	local cmp_action = require("lsp-zero").cmp_action()

	local function has_words_before()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	require("luasnip.loaders.from_vscode").lazy_load()

	vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#6CC644" })
	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#FA31A7" })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FF7F50" })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#00FFF9" })

	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "path" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "gitmoji" },
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
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

			-- Navigate between snippet placeholder
			["<C-f>"] = cmp_action.luasnip_jump_forward(),
			["<C-b>"] = cmp_action.luasnip_jump_backward(),
		},
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				preset = "codicons",
				symbol_map = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "ﰠ",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "塞",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Filder = "",
					EnumMember = "",
					Constant = "",
					Struct = "פּ",
					Event = "",
					Operator = "",
					TypeParameter = "",
				},

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				before = function(_, vim_item)
					return vim_item
				end,
			}),
		},
	})
end

return _M
