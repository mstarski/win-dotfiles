local api = require("nvim-tree.api")

-- disable netrw at the very start of your init.lua (strongly advised) vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
	on_attach = function(buffer)
		-- Actions menu
		local tree_actions = {
			{
				name = "Create node",
				handler = api.fs.create,
			},
			{
				name = "Remove node",
				handler = api.fs.remove,
			},
			{
				name = "Trash node",
				handler = api.fs.trash,
			},
			{
				name = "Rename node",
				handler = api.fs.rename,
			},
			{
				name = "Fully rename node",
				handler = api.fs.rename_sub,
			},
			{
				name = "Copy",
				handler = api.fs.copy.node,
			},
			{
				name = "Paste",
				handler = api.fs.paste,
			},
			{
				name = "Refresh",
				handler = api.tree.reload,
			},
		}

		local function tree_actions_menu(node)
			local entry_maker = function(menu_item)
				return {
					value = menu_item,
					ordinal = menu_item.name,
					display = menu_item.name,
				}
			end

			local finder = require("telescope.finders").new_table({
				results = tree_actions,
				entry_maker = entry_maker,
			})

			local sorter = require("telescope.sorters").get_generic_fuzzy_sorter()

			local default_options = {
				finder = finder,
				sorter = sorter,
				attach_mappings = function(prompt_buffer_number)
					local actions = require("telescope.actions")

					-- On item select
					actions.select_default:replace(function()
						local state = require("telescope.actions.state")
						local selection = state.get_selected_entry()
						-- Closing the picker
						actions.close(prompt_buffer_number)
						-- Executing the callback
						selection.value.handler(node)
					end)

					-- The following actions are disabled in this example
					-- You may want to map them too depending on your needs though
					actions.add_selection:replace(function() end)
					actions.remove_selection:replace(function() end)
					actions.toggle_selection:replace(function() end)
					actions.select_all:replace(function() end)
					actions.drop_all:replace(function() end)
					actions.toggle_all:replace(function() end)

					return true
				end,
			}

			-- Opening the menu
			require("telescope.pickers").new({ prompt_title = "Tree menu" }, default_options):find()
		end

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = buffer, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set("n", "<C-Space>", tree_actions_menu, { buffer = buffer, noremap = true, silent = true })
		vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
		vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
		vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
		vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
		vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
		vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
		vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
		vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
		vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
		vim.keymap.set("n", "a", api.fs.create, opts("Create"))
		vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
		vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
		vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
		vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
		vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
		vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
		vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
		vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
		vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
		vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
		vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
		vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
		vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
		vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
		vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
		vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
		vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
		vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
		vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
		vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
		vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
		vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
		vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
		vim.keymap.set("n", "q", api.tree.close, opts("Close"))
		vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
		vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
		vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
		vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
		vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
		vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
		vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
		vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
		vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
		vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	end,
})

vim.keymap.set("n", "<C-b>", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>q", ":NvimTreeFindFile<CR>")
