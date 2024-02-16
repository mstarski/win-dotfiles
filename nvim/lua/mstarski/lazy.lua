local env = require("mstarski.env")
local utils = require("mstarski.utils")
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
		{ "smartpde/telescope-recent-files" },
		{ "nvim-telescope/telescope-symbols.nvim" },
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "theprimeagen/harpoon" },
		{ "mbbill/undotree" },
		{ "tpope/vim-fugitive" },
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
		{ "tpope/vim-surround" },
		{ "tpope/vim-commentary" },
		{ "sbdchd/neoformat" },
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		},
		{ "windwp/nvim-autopairs" },
		{ "ellisonleao/glow.nvim" },
		{ "phaazon/hop.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "preservim/nerdcommenter" },
		{ "christoomey/vim-tmux-navigator" },
		{ "b0o/schemastore.nvim" },
		{ "nvim-tree/nvim-tree.lua" },
		{ "goolord/alpha-nvim" },
		{ "moll/vim-bbye" },
		{ "wellle/targets.vim" },
		{ "onsails/lspkind.nvim" },
		{
			"folke/noice.nvim",
			dependencies = { "MunifTanjim/nui.nvim" },
		},
		{ "github/copilot.vim", cond = env.aiCompletion == "copilot" },
		{ "codota/tabnine-nvim", build = "./dl_binaries.sh", cond = env.aiCompletion == "tabnine" },
		{
			"jackMort/ChatGPT.nvim",
			cond = utils.file_exists("/.secrets/openai"),
			config = function()
				local config = require("modules.gptconfig")
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
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"Issafalcon/neotest-dotnet",
				"nvim-neotest/neotest-jest",
			},
		},
		{ "mattn/emmet-vim" },
		{
			"nvim-pack/nvim-spectre",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"Dynge/gitmoji.nvim",
			dependencies = {
				"hrsh7th/nvim-cmp",
			},
			opts = {},
			ft = "gitcommit",
		},
	},
})
