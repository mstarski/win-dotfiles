local lspconfig = require("lspconfig")
local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = { set_sources = "recommended" },
})
local schemastore = require("schemastore")
local ts = require("typescript")
local my_cmp = require("modules.cmp")

lsp.ensure_installed({ "tsserver", "lua_ls" })
lsp.set_sign_icons({ error = "🔴", warn = "🟡", hint = "🙈", info = "🔵" })
lsp.setup({ sources = { { name = "nvim_lsp" }, { name = "nvim_lua" } } })

lsp.skip_server_setup({ "tsserver" })

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- TYPESCRIPT
ts.setup({})

-- JSON
lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
})

-- YAML
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			keyOrdering = false,
			schemaStore = true,
			completion = true,
			validate = true,
			schemas = schemastore.yaml.schemas(),
		},
	},
})

-- .NET
lspconfig.omnisharp.setup({
	cmd = { "omnisharp", "-lsp" },
	root_dir = lspconfig.util.root_pattern(".git", "obj"),
	filetypes = { "cs" },
	settings = {
		Zero = {
			diagnosticFilter = {
				exclude = { "**/obj/**", "**/bin/**" },
			},
		},
		RoslynExtensionsOptions = {
			enableAnalyzersSupport = true,
			enableCodeFixesSupport = true,
			enableRefactoringsSupport = true,
		},
	},
})

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<M-e>", vim.diagnostic.open_float)
vim.keymap.set("n", "<M-w>", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>oi", ts.actions.organizeImports)
vim.keymap.set("n", "<leader>ru", ts.actions.removeUnused)
vim.keymap.set("n", "<leader>am", ts.actions.addMissingImports)

my_cmp.setup_cmp()
