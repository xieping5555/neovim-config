local config = {}

config.tabout = function()
    require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
            {open = "'", close = "'"}, {open = '"', close = '"'},
            {open = '`', close = '`'}, {open = '(', close = ')'},
            {open = '[', close = ']'}, {open = '{', close = '}'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
    }
end

config.comment = function() require('Comment').setup {} end

config.nvim_tree = function()
    local keylist = {
        {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
        {key = {"O"}, action = "edit_no_picker"},
        {key = {"<2-RightMouse>", "<C-]>"}, action = "cd"},
        {key = "v", action = "vsplit"}, {key = "s", action = "split"},
        {key = "<C-t>", action = "tabnew"},
        {key = "<", action = "prev_sibling"},
        {key = ">", action = "next_sibling"},
        {key = "P", action = "parent_node"},
        {key = "<BS>", action = "close_node"},
        {key = "<Tab>", action = "preview"},
        {key = "K", action = "first_sibling"},
        {key = "J", action = "last_sibling"},
        {key = "I", action = "toggle_ignored"},
        {key = "H", action = "toggle_dotfiles"},
        {key = "R", action = "refresh"}, {key = "a", action = "create"},
        {key = "d", action = "remove"}, {key = "D", action = "trash"},
        {key = "r", action = "rename"}, {key = "<C-r>", action = "full_rename"},
        {key = "x", action = "cut"}, {key = "c", action = "copy"},
        {key = "p", action = "paste"}, {key = "y", action = "copy_name"},
        {key = "Y", action = "copy_path"},
        {key = "gy", action = "copy_absolute_path"},
        {key = "[c", action = "prev_git_item"},
        {key = "]c", action = "next_git_item"}, {key = "-", action = "dir_up"},
        {key = "S", action = "system_open"}, {key = "q", action = "close"},
        {key = "H", action = "toggle_help"}
    }
    require("nvim-tree").setup {

        disable_netrw = false,
        hijack_netrw = true,
        open_on_setup = true,
        ignore_ft_on_setup = {},
        auto_close = false,
        auto_reload_on_write = true,
        open_on_tab = true,
        hijack_cursor = false,
        update_cwd = false,
        hijack_unnamed_buffer_when_opening = true,
        hijack_directories = {enable = true, auto_open = true},
        diagnostics = {
            enable = false,
            icons = {hint = "", info = "", warning = "", error = ""}
        },
        update_focused_file = {
            enable = true,
            update_cwd = false,
            ignore_list = {}
        },
        system_open = {cmd = nil, args = {}},
        filters = {dotfiles = false, custom = {}},
        git = {enable = true, ignore = true, timeout = 500},
        view = {
            width = 40,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            auto_resize = false,
            mappings = {custom_only = false, list = keylist},
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        trash = {cmd = "trash", require_confirm = true},
        actions = {
            change_dir = {global = false},
            open_file = {quit_on_open = false}
        }
    }
end

config.toggleterm = function() require("toggleterm").setup {} end

config.autopairs = function()
    require("nvim-autopairs").setup({})

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done",
                 cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
    cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
end

config.treesitter = function()
    require'nvim-treesitter.configs'.setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "maintained",

        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing
        ignore_install = {"javascript"},

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- list of language that will be disabled
            disable = {"c", "rust"},

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false
        }
    }
end

config.spellchecker =
    function() require('spellsitter').setup {enable = true} end

config.lualine = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = {left = '', right = ''},
            -- component_separators = {left = '|', right = '|'},
            -- section_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    }
end

config.gitsigns = function()
    require('gitsigns').setup {
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '│',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn'
            },
            change = {
                hl = 'GitSignsChange',
                text = '│',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '_',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '‾',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            }
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {interval = 1000, follow_files = true},
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 300,
            ignore_whitespace = false
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm = {enable = false}
    }
end

config.go = function()
    require('go').setup({
        go = 'go', -- go command, can be go[default] or go1.18beta1
        goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
        fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
        gofmt = 'gofumpt', -- gofmt cmd,
        max_line_len = 1200, -- max line length in goline format
        tag_transform = false, -- tag_transfer  check gomodifytags for details
        test_template = '', -- g:go_nvim_tests_template  check gotests for details
        test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = {breakpoint = '🧘', currentpos = '🏃'},
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_codelens = true, -- set to false to disable codelens, true by default
        lsp_diag_hdlr = true, -- hook lsp diag handler
        -- virtual text setup
        lsp_diag_virtual_text = {space = 0, prefix = ""},
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        dap_debug = true, -- set to false to disable dap
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
        dap_debug_vt = true, -- set to true to enable dap virtual text
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true, -- enable default text jobects through treesittter-text-objects
        test_runner = 'go', -- richgo, go test, richgo, dlv, ginkgo
        run_in_floaterm = true -- set to true to run in float window.
        -- float term recommand if you use richgo/ginkgo with terminal color
    })
    -- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
    -- vim.cmd([[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]])
    -- vim.cmd([[autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)]])
end

return config
