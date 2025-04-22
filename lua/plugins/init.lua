local overrides = require "configs.overrides"

return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
        lazy = false,
    },
    {
        "nvchad/ui",
        config = function()
            require "nvchad"
        end,
    },
    { "nvzone/volt", lazy = true },
    { "nvzone/menu", lazy = true },
    {
        "nvchad/base46",
        lazy = false,
        branch = "v3.0",
        build = function()
            require("base46").load_all_highlights()
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup {
                lightbulb = {
                    enable = false,
                    sign = false,
                },
                code_action = {
                    show_server_name = true,
                    extend_gitsigns = false,
                },
            }
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "tsserver",
                "gopls",
                "pylyzer",
                "thriftls",
            },
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "goimports",
                "gofumt",
                "shfmt",
                "golangci-lint",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "go",
                "python",
                "json",
                "javascript",
                "gomod",
                "gosum",
                "thrift",
            },
        },
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGitCurrentFile", "LazyGit" },
    },
    {
        "abecodes/tabout.nvim",
        lazy = false,
    },
    {
        "j-hui/fidget.nvim",
        lazy = false,
        opts = {},
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function(_, opts)
            require("lsp_signature").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup {
                floaterm = {
                    position = "right",
                    width = 0.45, -- width of float window if not auto
                    height = 0.98, -- height of float window if not auto
                    title_colors = "tokyo",
                },
                lsp_inlay_hints = {
                    enable = false,
                },
            }
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        "nvim-pack/nvim-spectre",
        config = function()
            require("spectre").setup()
        end,
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = overrides.cmp,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "smartpde/telescope-recent-files",
        config = function()
            require("telescope").load_extension "recent_files"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = overrides.nvim_tree,
    },
    {
        "ggandor/leap.nvim",
        lazy = false,
    },
    {
        "edolphin-ydf/goimpl.nvim",
        ft = { "go", "gomod" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("telescope").load_extension "goimpl"
        end,
    },
    {
        "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        lazy = false,
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup()
        end,
    },
    -- Lua
    {
        "folke/zen-mode.nvim",
        lazy = false,
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 0.8,
                },
                plugins = {
                    twilight = { enable = true },
                    kitty = {
                        enabled = true,
                        font = "+4",
                    },
                },
            }
        end,
    },
}
