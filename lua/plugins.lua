-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local editorConf = require 'editor.config'
local lspConf = require 'lsp.config'

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorscheme
    use 'rktjmp/lush.nvim'
    use 'mangeshrex/everblush.vim'
    use 'ayu-theme/ayu-vim'
    use 'dracula/vim'
    use 'joshdick/onedark.vim'
    use 'pineapplegiant/spaceduck'
    use 'Mangeshrex/uwu.vim'
    use 'mcchrish/zenbones.nvim'
    use 'sonph/onehalf'
    use 'kaicataldo/material.vim'
    use 'mhartington/oceanic-next'
    use 'folke/tokyonight.nvim'
    use 'luisiacc/gruvbox-baby'
    use {'srcery-colors/srcery-vim', as = 'srcery'}
    use 'NLKNguyen/papercolor-theme'
    use 'rakr/vim-one'
    use 'lifepillar/vim-solarized8'
    use 'sainnhe/everforest'
    use 'cormacrelf/vim-colors-github'
    use 'arzg/vim-colors-xcode'
    use 'whatyouhide/vim-gotham' -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'ray-x/lsp_signature.nvim', config = lspConf.lsp_signature()}
    use 'L3MON4D3/LuaSnip'
    use {'tami5/lspsaga.nvim', config = lspConf.lsp_saga()} use {
        'RishabhRD/nvim-lsputils',
        requires = {'RishabhRD/popfix'},
        config = lspConf.nvim_lsputils()
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
    -- use {
    --     'tzachar/cmp-tabnine',
    --     run='./install.sh',
    --     requires = 'hrsh7th/nvim-cmp'
    -- }
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
    use {"akinsho/toggleterm.nvim", config = editorConf.toggleterm()}
    -- autopairs
    use {'windwp/nvim-autopairs', config = editorConf.autopairs()}
    -- tab
    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    -- indent
    use {"lukas-reineke/indent-blankline.nvim"}
    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    -- enhance jk move
    use 'rhysd/accelerated-jk'
    -- easyalign
    use 'junegunn/vim-easy-align'
    -- comment
    use {'numToStr/Comment.nvim', config = editorConf.comment()}
    -- tabout
    use {'abecodes/tabout.nvim', config = editorConf.tabout()}
    -- neoformat
    use {'sbdchd/neoformat'}
    -- spellchecker
    use {'lewis6991/spellsitter.nvim', config = editorConf.spellchecker()}
    -- git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = editorConf.gitsigns()
    }
    -- thrift highlight
    use 'solarnz/thrift.vim'
    -- remove empty line at the end of the buffer
    use { "McAuleyPenney/tidy.nvim", event = "BufWritePre" }
    -- dashboard
    use 'glepnir/dashboard-nvim'
    use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
    -- surround
    use 'tpope/vim-surround'
    -- uml
    use 'skanehira/preview-uml.vim'
    use 'aklt/plantuml-syntax'
end)
