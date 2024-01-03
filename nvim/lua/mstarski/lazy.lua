local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		{
			"nvim-telescope/telescope.nvim",
			version = "0.1.4",
			dependencies = { { "nvim-lua/plenary.nvim" } },
		},
		"smartpde/telescope-recent-files",
		"nvim-telescope/telescope-symbols.nvim",
		{ "rose-pine/neovim", name = "rose-pine" },
		{ "doums/darcula", name = "darcula" },
		"nvim-treesitter/nvim-treesitter",
		"theprimeagen/harpoon",
		"mbbill/undotree",
		"tpope/vim-fugitive",
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v2.x",
			dependencies = {
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
				{ "jose-elias-alvarez/typescript.nvim" },
			},
		},
		"tpope/vim-surround",
		"tpope/vim-commentary",
		"sbdchd/neoformat",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		},
		"windwp/nvim-autopairs",
		"ellisonleao/glow.nvim",
		"phaazon/hop.nvim",
		"nvim-tree/nvim-web-devicons",
		"preservim/nerdcommenter",
		"christoomey/vim-tmux-navigator",
		"b0o/schemastore.nvim",
		{ "nvim-tree/nvim-tree.lua" },
		{ "goolord/alpha-nvim" },
		{ "moll/vim-bbye" },
		{ "wellle/targets.vim" },
		{ "onsails/lspkind.nvim" },
		{
			"folke/noice.nvim",
			dependencies = { "MunifTanjim/nui.nvim" },
		},
		{ "github/copilot.vim" },
		{
			"jackMort/ChatGPT.nvim",
			config = function()
				local config = require("mstarski.gptconfig")
				require("chatgpt").setup(config.chatGptConfig())
			end,
			dependencies = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		},
		{ "stevearc/resession.nvim" },
		{ "norcalli/nvim-colorizer.lua" },
		{
			"mfussenegger/nvim-dap",
			dependencies = {
				{ "rcarriga/nvim-dap-ui" },
				{ "nvim-telescope/telescope-dap.nvim" },
				{ "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
				{
					"microsoft/vscode-js-debug",
					lazy = true,
					build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
				},
			},
		},
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"Issafalcon/neotest-dotnet",
				"nvim-neotest/neotest-jest",
			},
		},
		"mattn/emmet-vim",
		{
			"antosha417/nvim-lsp-file-operations",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-tree.lua",
			},
		},
	},
})
