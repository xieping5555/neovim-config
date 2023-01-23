-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'Luxed/ayu-vim'

  -- syntax highlight
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- file tree
  use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- terminal
    use 'voldikss/vim-floaterm'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-live-grep-args.nvim'}
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    }

    -- lsp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'lukas-reineke/cmp-under-comparator',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'rafamadriz/friendly-snippets',
            'onsails/lspkind-nvim'
        }
    }
    use {
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        config = function()
          require('lspsaga').setup({})
        end
    }

    -- lsp package manager
    use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"}

    -- show code context in statusline
    use {"SmiteshP/nvim-navic"}

    -- lsp loading progress
    use {'j-hui/fidget.nvim', config = function() require"fidget".setup{} end}

    -- remove empty line at the end of the buffer
    use 'mcauley-penney/tidy.nvim'

    use 'windwp/nvim-autopairs'

    use 'abecodes/tabout.nvim'

    use 'numToStr/Comment.nvim'
end)
