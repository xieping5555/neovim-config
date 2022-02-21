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
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = '`', close = '`' },
            { open = '(', close = ')' },
            { open = '[', close = ']' },
            { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
    }
end

config.comment = function()
    require('Comment').setup {}
end

config.nvim_tree = function()
    local keylist = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = { "O" }, action = "edit_no_picker" },
        { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "I", action = "toggle_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[c", action = "prev_git_item" },
        { key = "]c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        { key = "s", action = "system_open" },
        { key = "q", action = "close" },
        { key = "g?", action = "toggle_help" },
    }
    require("nvim-tree").setup {

        disable_netrw                      = false,
        hijack_netrw                       = true,
        open_on_setup                      = true,
        ignore_ft_on_setup                 = {},
        auto_close                         = true,
        auto_reload_on_write               = true,
        open_on_tab                        = false,
        hijack_cursor                      = false,
        update_cwd                         = false,
        hijack_unnamed_buffer_when_opening = true,
        hijack_directories                 = {
            enable = true,
            auto_open = true,
        },
        diagnostics                        = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        update_focused_file                = {
            enable      = false,
            update_cwd  = false,
            ignore_list = {}
        },
        system_open                        = {
            cmd  = nil,
            args = {}
        },
        filters                            = {
            dotfiles = false,
            custom = {}
        },
        git                                = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        view                               = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            auto_resize = false,
            mappings = {
                custom_only = false,
                list = keylist
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        trash                              = {
            cmd = "trash",
            require_confirm = true
        },
        actions                            = {
            change_dir = {
                global = false,
            },
            open_file = {
                quit_on_open = false,
            }
        }
    }
end

config.toggleterm = function()
    require("toggleterm").setup {}
end

config.autopairs = function()
    require("nvim-autopairs").setup({})

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
end

config.treesitter = function()
    require 'nvim-treesitter.configs'.setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "maintained",

        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing
        ignore_install = { "javascript" },

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- list of language that will be disabled
            disable = { "c", "rust" },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
end

config.spellchecker = function()
    require('spellsitter').setup {
        enable = true,
    }
end

config.lualine = function()
    require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
    }
end

config.formatter = function()
    require('formatter').setup({
        filetype = {
            -- Configuration for gofmt
            go = {
                function()
                    return {
                        exe = "gofmt",
                        args = { "-w" },
                        stdin = true
                    }
                end
            },
        }
    })
    vim.api.nvim_exec([[
        augroup FormatAutogroup
            autocmd!
            autocmd BufWritePost *.js,*.rs, *.go FormatWrite
        augroup END
    ]], true)
end

config.gitsigns = function()
    require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 0,
    ignore_whitespace = false,
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
  yadm = {
    enable = false
  },
}
end

return config
