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
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
        opts = overrides.cmp,
        -- dependencies = { "saghen/blink.cmp" },
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
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
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
        "https://code.byted.org/chenjiaqi.cposture/codeverse.vim.git",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeverse").setup {
                codeverse_filetypes = {
                    thrift = true,
                },
            }
        end,
        lazy = false,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = overrides.cmp,
    },
    -- {
    --     "saghen/blink.cmp",
    --     lazy = false, -- lazy loading handled internally
    --     -- optional: provides snippets for the snippet source
    --     dependencies = "rafamadriz/friendly-snippets",
    --     -- use a release tag to download pre-built binaries
    --     version = "v0.*",
    --     -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    --     -- build = 'cargo build --release',
    --     -- If you use nix, you can build from source using latest nightly rust with:
    --     -- build = 'nix run .#build-plugin',
    --
    --     ---@module 'blink.cmp'
    --     ---@type blink.cmp.Config
    --     opts = {
    --         -- 'default' for mappings similar to built-in completion
    --         -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    --         -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    --         -- see the "default configuration" section below for full documentation on how to define
    --         -- your own keymap.
    --         keymap = { preset = "enter" },
    --
    --         appearance = {
    --             -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    --             -- Useful for when your theme doesn't support blink.cmp
    --             -- will be removed in a future release
    --             use_nvim_cmp_as_default = true,
    --             -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --             -- Adjusts spacing to ensure icons are aligned
    --             nerd_font_variant = "mono",
    --         },
    --
    --         -- default list of enabled providers defined so that you can extend it
    --         -- elsewhere in your config, without redefining it, via `opts_extend`
    --         sources = {
    --             default = { "lsp", "path", "snippets", "buffer" },
    --         },
    --
    --         -- experimental signature help support
    --         signature = { enabled = true },
    --     },
    --     -- allows extending the providers array elsewhere in your config
    --     -- without having to redefine it
    --     opts_extend = { "sources.default" },
    -- },
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
        "folke/trouble.nvim",
        cmd = "Trouble",
        lazy = false,
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}
