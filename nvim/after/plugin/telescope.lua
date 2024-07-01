local builtin = require("telescope.builtin")
local telescope = require("telescope")
local actions = require("telescope.actions")

local prompt = " 🔍 "

telescope.setup({
	defaults = {
		file_ignore_patterns = { "git", "node_modules", "dist" },
		prompt_prefix = prompt,

		-- :h telescope.defaults.path_display

		mappings = { i = { ["<esc>"] = actions.close } },

		layout_strategy = "center",
		sorting_strategy = "ascending",
		layout_config = {
			center = {
				preview_cutoff = 60,
				width = 0.9,
				height = 0.3,
			},
		},

		path_display = function(opts, path)
			local tail = require("telescope.utils").path_tail(path)
			return string.format("%s (%s)", tail, path)
		end,
	},

	extensions = {
		recent_files = {
			only_cwd = true,
		},
	},

	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},

		live_grep = {
			theme = "dropdown",
			literal = true,
		},

		lsp_references = {
			path_display = { "tail" },
		},
	},
})

telescope.load_extension("recent_files")
telescope.load_extension("dap")

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

vim.keymap.set("n", "gd", function()
	builtin.lsp_definitions()
end)

-- Emoji
vim.keymap.set("n", "<leader>;", function()
	builtin.symbols({ sources = { "emoji", "gitmoji" } })
end)
