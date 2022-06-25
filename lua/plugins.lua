-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local editorConf = require 'editor.config'
local lspConf = require 'lsp.config'

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorscheme
    use 'olimorris/onedarkpro.nvim'
    use "EdenEast/nightfox.nvim"
    use 'shaeinst/roshnivim-cs'
    use 'rktjmp/lush.nvim'
    use 'mangeshrex/everblush.vim'
    use 'ayu-theme/ayu-vim'
    use 'dracula/vim'
    -- use 'joshdick/onedark.vim'
    use 'pineapplegiant/spaceduck'
    use 'Mangeshrex/uwu.vim'
    use 'mcchrish/zenbones.nvim'
    use 'morhetz/gruvbox'
    -- use 'sonph/onehalf'
    -- use 'kaicataldo/material.vim'
    -- use 'mhartington/oceanic-next'
    -- use 'folke/tokyonight.nvim'
    -- use 'luisiacc/gruvbox-baby'
    -- use {'srcery-colors/srcery-vim', as = 'srcery'}
    -- use 'NLKNguyen/papercolor-theme'
    -- use 'rakr/vim-one'
    -- use 'lifepillar/vim-solarized8'
    -- use 'sainnhe/everforest'
    -- use 'cormacrelf/vim-colors-github'
    -- use 'arzg/vim-colors-xcode'
    -- use {'kyoz/purify', rtp = "vim"}
    -- use 'yasukotelin/shirotelin'
    -- use 'whatyouhide/vim-gotham'
    -- use 'jsit/toast.vim'
    -- use 'dunstontc/vim-vscode-theme'
    -- use 'rhysd/vim-color-spring-night'
    -- use 'ajgrf/parchment'
    -- use 'NSBrianWard/Glacier-Remixes'
    use 'lifepillar/vim-wwdc17-theme'
    use "projekt0n/github-nvim-theme"
    use 'kyazdani42/blue-moon'
    use 'ku-s-h/summerfruit256.vim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'ray-x/lsp_signature.nvim', config = lspConf.lsp_signature()}
    use 'L3MON4D3/LuaSnip'
    use {'tami5/lspsaga.nvim', config = lspConf.lsp_saga()}
    use {
        'RishabhRD/nvim-lsputils',
        requires = {'RishabhRD/popfix'},
        config = lspConf.nvim_lsputils()
    }
    use 'github/copilot.vim'
    use {"zbirenbaum/copilot-cmp", after = {"copilot.lua", "nvim-cmp"}}
    use {
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function()
            vim.defer_fn(function() require("copilot").setup() end, 100)
        end
    }
    -- nvim-cmp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'lukas-reineke/cmp-under-comparator', 'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp },
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', -- { name = 'cmdline' }
            'hrsh7th/cmp-vsnip', -- { name = 'vsnip' }
            'rafamadriz/friendly-snippets', 'onsails/lspkind-nvim'
        }
    }
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    -- lsp progress
    use {'j-hui/fidget.nvim', config = lspConf.fidget()}
    -- golang
    use {'ray-x/go.nvim', config = editorConf.go()}
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', config = editorConf.treesitter()}
    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = editorConf.lualine()
    }
    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = editorConf.nvim_tree()
    }
    -- terminal
    use 'voldikss/vim-floaterm'
    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- tab
    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    -- enhance jk move
    -- use 'rhysd/accelerated-jk'
    -- easyalign
    use 'junegunn/vim-easy-align'
    -- comment
    use {'numToStr/Comment.nvim', config = editorConf.comment()}
    -- tabout
    use {'abecodes/tabout.nvim', config = editorConf.tabout()}
    -- neoformat
    use {'sbdchd/neoformat'}
    -- spellchecker
    use {
        'lewis6991/spellsitter.nvim',
        config = function() require('spellsitter').setup {enable = true} end
    }
    -- git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = editorConf.gitsigns()
    }
    -- thrift highlight
    use 'solarnz/thrift.vim'
    -- remove empty line at the end of the buffer
    use {
        "mcauley-penney/tidy.nvim",
        event = "BufWritePre",
        config = function() require("tidy").setup() end
    }
    -- dashboard
    -- use 'glepnir/dashboard-nvim'
    use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
    -- surround
    use 'tpope/vim-surround'
    -- uml
    use 'skanehira/preview-uml.vim'
    use 'aklt/plantuml-syntax'
    -- buffer max
    use 'szw/vim-maximizer'
    -- markdown
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    use 'nvim-lua/popup.nvim'
    use 'rcarriga/nvim-notify'

    -- search and replace
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-pack/nvim-spectre', config = editorConf.spectre()}

    -- debugger
    -- use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
    -- use "mfussenegger/nvim-dap"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "rcarriga/nvim-dap-ui"

end)
