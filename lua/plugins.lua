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

return require("lazy").setup({
	---------------------------------------
	-- NOTE: PUT YOUR THIRD PLUGIN HERE --
	---------------------------------------
	-- theme
	"rebelot/kanagawa.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"projekt0n/github-nvim-theme",
	"EdenEast/nightfox.nvim",
	"Shatur/neovim-ayu",
	"navarasu/onedark.nvim",
	"ellisonleao/gruvbox.nvim",
	"shaunsingh/nord.nvim",
	"Mofiqul/dracula.nvim",
	{ "rose-pine/neovim", name = "rose-pine" },
	"marko-cerovac/material.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"sam4llis/nvim-tundra",
	"aditya-azad/candle-grey",
	"andreypopp/vim-colors-plain",
	"reedes/vim-colors-pencil",
	"Jorengarenar/vim-darkness",
	"ewilazarus/preto",
	"kvrohit/rasmus.nvim",
	"olimorris/onedarkpro.nvim",
	"olivercederborg/poimandres.nvim",
	"Verf/deepwhite.nvim",
	"glepnir/zephyr-nvim",
	"savq/melange-nvim",
	"Mofiqul/adwaita.nvim",
	"folke/tokyonight.nvim",
	"Mofiqul/vscode.nvim",
	"Th3Whit3Wolf/one-nvim",
	"scottmckendry/cyberdream.nvim",
	"neanias/everforest-nvim",

	-- file tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	"abecodes/tabout.nvim",

	{ "nvimtools/none-ls.nvim", dependencies = {
		"nvim-lua/plenary.nvim",
	} },

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},

	-- lsp package manager
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- lsp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
		},
	},

	"ray-x/lsp_signature.nvim",

	"onsails/lspkind.nvim",

	"nvimdev/lspsaga.nvim",
	-- Code snippet engine
	"L3MON4D3/LuaSnip",
	{ "saadparwaiz1/cmp_luasnip" },

	-- lsp loading progress
	-- use({ "j-hui/fidget.nvim", tag = "legacy" })

	"windwp/nvim-autopairs",

	"numToStr/Comment.nvim",

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"arkav/lualine-lsp-progress",

	-- which key
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- terminal
	"voldikss/vim-floaterm",

	-- git
	"lewis6991/gitsigns.nvim",

	-- use("xiyaowong/transparent.nvim")

	-- indent line
	{ "shellRaining/hlchunk.nvim" },

	"folke/zen-mode.nvim",

	"karb94/neoscroll.nvim",

	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
	},

	{
		"VonHeikemen/searchbox.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},

	"ggandor/leap.nvim",

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"ray-x/go.nvim",
		dependencies = {
			{ "ray-x/guihua.lua" },
		},
	},

	"yamatsum/nvim-cursorline",

	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	"HiPhish/rainbow-delimiters.nvim",

	{ "rainbowhxch/accelerated-jk.nvim" },
}, {})
