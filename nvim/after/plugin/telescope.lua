local builtin = require("telescope.builtin")
local telescope = require("telescope")
local actions = require("telescope.actions")

local prompt = " 🔍 "

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		file_ignore_patterns = { "git", "node_modules", "dist" },
		prompt_prefix = prompt,

		-- :h telescope.defaults.path_display
		path_display = { "truncate" },

		mappings = { i = { ["<esc>"] = actions.close } },
	},

	extensions = {
		recent_files = {
			only_cwd = true,
			theme = "dropdown",
		},
	},

	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			theme = "dropdown",
		},

		git_files = {
			theme = "dropdown",
		},

		oldfiles = {
			theme = "dropdown",
		},

		live_grep = {
			theme = "dropdown",
			literal = true,
		},

		treesitter = {
			theme = "dropdown",
		},

		recent_files = {
			theme = "dropdown",
		},

		lsp_references = {
			path_display = { "tail" },
		},
	},
})

telescope.load_extension("recent_files")

local project_files = function()
	local opts = { hidden = true } -- define here if you want to define something

	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

-- this works as both C-n and C-S-n. Terminal cannot distinguish C-x and C-S-x operations
vim.keymap.set("n", "<C-n>", project_files)
vim.keymap.set("n", "<C-\\>", builtin.find_files)

vim.keymap.set("n", "<leader>ps", function()
	builtin.live_grep()
end)

vim.keymap.set("", "<C-s>", function()
	builtin.lsp_dynamic_workspace_symbols()
end)

vim.keymap.set("n", "<leader>gr", function()
	builtin.lsp_references()
end)

vim.keymap.set("", "<BS>", ":Telescope resume<CR>")

-- Recent files window
vim.keymap.set(
	"n",
	"<C-e>",
	[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
	{ noremap = true, silent = true }
)

-- Emoji
vim.keymap.set("n", "<leader>:", function()
	builtin.symbols({ sources = { "emoji", "gitmoji" } })
end)
