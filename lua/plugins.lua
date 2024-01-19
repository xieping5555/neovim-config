-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	---------------------------------------
	-- NOTE: PUT YOUR THIRD PLUGIN HERE --
	---------------------------------------
	-- theme
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "projekt0n/github-nvim-theme" })
	use("EdenEast/nightfox.nvim")
	use("Shatur/neovim-ayu")
	use("navarasu/onedark.nvim")
	use({ "ellisonleao/gruvbox.nvim" })
	use("shaunsingh/nord.nvim")
	use("Mofiqul/dracula.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("marko-cerovac/material.nvim")
	use({ "nyoom-engineering/oxocarbon.nvim" })
	use("sam4llis/nvim-tundra")
	use("aditya-azad/candle-grey")
	use("andreypopp/vim-colors-plain")
	use("reedes/vim-colors-pencil")
	use("Jorengarenar/vim-darkness")
	use("ewilazarus/preto")
	use("kvrohit/rasmus.nvim")
	use("olimorris/onedarkpro.nvim")
	use("olivercederborg/poimandres.nvim")
	use("Verf/deepwhite.nvim")
	use("glepnir/zephyr-nvim")
	use("savq/melange-nvim")
	-- use("ThemerCorp/themer.lua")
	use({
		"daltonmenezes/aura-theme",
		rtp = "packages/neovim",
		-- config = function()
		-- 	vim.cmd("colorscheme aura-soft-dark") -- Or any Aura theme available
		-- end,
	})
	use("Mofiqul/adwaita.nvim")
	use("folke/tokyonight.nvim")
	use("Mofiqul/vscode.nvim")
	use("Th3Whit3Wolf/one-nvim")
	use("scottmckendry/cyberdream.nvim")

	-- file tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	use("abecodes/tabout.nvim")

	use({ "nvimtools/none-ls.nvim", requires = {
		"nvim-lua/plenary.nvim",
	} })

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})

	-- lsp package manager
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- lsp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
		},
	})

	use("ray-x/lsp_signature.nvim")

	use("onsails/lspkind.nvim")

	use({
		"nvimdev/lspsaga.nvim",
		-- opt = true,
		-- branch = "main",
		-- event = "LspAttach",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	-- Code snippet engine
	use("L3MON4D3/LuaSnip")
	use({ "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } })

	-- lsp loading progress
	-- use({ "j-hui/fidget.nvim", tag = "legacy" })

	use("windwp/nvim-autopairs")

	use("numToStr/Comment.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("arkav/lualine-lsp-progress")

	-- which key
	use({
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
	})
	-- terminal
	use("voldikss/vim-floaterm")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- use("xiyaowong/transparent.nvim")

	-- indent line
	use({ "shellRaining/hlchunk.nvim" })

	use("folke/zen-mode.nvim")

	use("karb94/neoscroll.nvim")

	use({
		"kevinhwang91/nvim-ufo",
		requires = {
			"kevinhwang91/promise-async",
			"luukvbaal/statuscol.nvim",
		},
	})

	use({
		"VonHeikemen/searchbox.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	use("ggandor/leap.nvim")

	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"ray-x/go.nvim",
		requires = {
			{ "ray-x/guihua.lua" },
		},
	})

	use("yamatsum/nvim-cursorline")

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	use("HiPhish/rainbow-delimiters.nvim")

	use({ "rainbowhxch/accelerated-jk.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
