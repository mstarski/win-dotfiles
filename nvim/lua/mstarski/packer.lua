-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { noremap = true, silent = true })

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		-- also requires ripgrep for grep command to work
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("smartpde/telescope-recent-files")
	use("nvim-telescope/telescope-symbols.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "jose-elias-alvarez/typescript.nvim" },
		},
	})
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("sbdchd/neoformat")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("windwp/nvim-autopairs")
	use("ellisonleao/glow.nvim") -- markdown preview
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })
	use("phaazon/hop.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("preservim/nerdcommenter")
	use("christoomey/vim-tmux-navigator")
	use("b0o/schemastore.nvim")
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "goolord/alpha-nvim" })
	use({ "moll/vim-bbye" })
	use({ "wellle/targets.vim" })
	use({ "onsails/lspkind.nvim" })
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
	use({ "github/copilot.vim" })
	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use({ "stevearc/resession.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
			{
				"microsoft/vscode-js-debug",
				opt = true,
				run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
			},
		},
	})
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"Issafalcon/neotest-dotnet",
			"nvim-neotest/neotest-jest",
		},
	})
	use({ "mattn/emmet-vim" })
	use({
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
	})
end)
