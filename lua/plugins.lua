-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorscheme
    use 'olimorris/onedarkpro.nvim'
    use 'ayu-theme/ayu-vim'
    use 'dracula/vim'
    use 'pineapplegiant/spaceduck'
    use 'Mangeshrex/uwu.vim'
    use 'mcchrish/zenbones.nvim'
    use 'morhetz/gruvbox'
    use "projekt0n/github-nvim-theme"
    use 'nanotech/jellybeans.vim'
    use 'marko-cerovac/material.nvim'
    use 'catppuccin/nvim'
    use 'rktjmp/lush.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'ray-x/lsp_signature.nvim'}
    use 'L3MON4D3/LuaSnip'
    use {'tami5/lspsaga.nvim'}
    use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}
    -- use 'github/copilot.vim'
    -- use {"zbirenbaum/copilot-cmp", after = {"copilot.lua", "nvim-cmp"}}
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     event = {"VimEnter"},
    --     config = function()
    --         vim.defer_fn(function() require("copilot").setup() end, 100)
    --     end
    -- }
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
    use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"}
    use {"SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig"}
    -- code structure
    use {'stevearc/aerial.nvim'}
    -- lsp progress
    use {'j-hui/fidget.nvim'}
    -- golang
    use {'ray-x/go.nvim'}
    -- treesitter syntax highlight
    use {'nvim-treesitter/nvim-treesitter'}
    use 'nvim-treesitter/nvim-treesitter-context'
    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- filetree
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        }
    }
    -- terminal
    use 'voldikss/vim-floaterm'
    -- autopairs
    use {"windwp/nvim-autopairs"}
    -- bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {"nvim-telescope/telescope-live-grep-args.nvim"}
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    -- enhance jk move
    -- use 'rhysd/accelerated-jk'
    -- easyalign
    use 'junegunn/vim-easy-align'
    -- comment
    use {'numToStr/Comment.nvim'}
    -- tabout
    use {'abecodes/tabout.nvim'}
    -- neoformat
    use {'sbdchd/neoformat'}
    -- spellchecker
    use {'lewis6991/spellsitter.nvim'}
    -- git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- thrift highlight
    use 'solarnz/thrift.vim'
    -- remove empty line at the end of the buffer
    use "mcauley-penney/tidy.nvim"
    -- dashboard
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
    use {'nvim-pack/nvim-spectre'}

    -- light up you window
    -- use 'sunjon/Shade.nvim'

    -- better quickfix
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}

    -- debugger
    -- use "Pocco81/dap-buddy.nvim"
    -- use "mfussenegger/nvim-dap"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "rcarriga/nvim-dap-ui"
    -- solidity
    use 'tomlion/vim-solidity'

end)
