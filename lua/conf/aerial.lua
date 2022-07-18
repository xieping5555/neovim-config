local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    vim.notify("aerial not found")
    return
end

-- call the setup function to change the default behavior
aerial.setup({
    -- priority list of preferred backends for aerial.
    -- this can be a filetype map (see :help aerial-filetype-map)
    backends = {"treesitter", "lsp", "markdown"},

    -- enum: persist, close, auto, global
    --   persist - aerial window will stay open until closed
    --   close   - aerial window will close when original file is no longer visible
    --   auto    - aerial window will stay open as long as there is a visible
    --             buffer to attach to
    --   global  - same as 'persist', and will always show symbols for the current buffer
    close_behavior = "auto",

    -- set to false to remove the default keybindings for the aerial buffer
    default_bindings = true,

    -- enum: prefer_right, prefer_left, right, left, float
    -- determines the default direction to open the aerial window. the 'prefer'
    -- options will open the window in the other direction *if* there is a
    -- different buffer in the way of the preferred direction
    default_direction = "prefer_right",

    -- disable aerial on files with this many lines
    disable_max_lines = 10000,

    -- disable aerial on files this size or larger (in bytes)
    disable_max_size = 10000000,

    -- a list of all symbols to display. set to false to display all symbols.
    -- this can be a filetype map (see :help aerial-filetype-map)
    -- to see all available values, see :help symbolkind
    -- filter_kind = {
    --     "class", "constructor", "enum", "function", "interface", "module",
    --     "method", "struct"
    -- },
    filter_kind = false,

    -- enum: split_width, full_width, last, none
    -- determines line highlighting mode when multiple splits are visible.
    -- split_width   each open window will have its cursor location marked in the
    --               aerial buffer. each line will only be partially highlighted
    --               to indicate which window is at that location.
    -- full_width    each open window will have its cursor location marked as a
    --               full-width highlight in the aerial buffer.
    -- last          only the most-recently focused window will have its location
    --               marked in the aerial buffer.
    -- none          do not show the cursor locations in the aerial window.
    highlight_mode = "split_width",

    -- highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,

    -- highlight the symbol in the source buffer when cursor is in the aerial win
    highlight_on_hover = true,

    -- when jumping to a symbol, highlight the line for this many ms.
    -- set to false to disable
    highlight_on_jump = 300,

    -- define symbol icons. you can also specify "<symbol>collapsed" to change the
    -- icon when the tree is collapsed at that symbol, or "collapsed" to specify a
    -- default collapsed icon. the default icon set is determined by the
    -- "nerd_font" option below.
    -- if you have lspkind-nvim installed, aerial will use it for icons.
    icons = {},

    -- control which windows and buffers aerial should ignore.
    -- if close_behavior is "global", focusing an ignored window/buffer will
    -- not cause the aerial window to update.
    -- if open_automatic is true, focusing an ignored window/buffer will not
    -- cause an aerial window to open.
    -- if open_automatic is a function, ignore rules have no effect on aerial
    -- window opening behavior; it's entirely handled by the open_automatic
    -- function.
    ignore = {
        -- ignore unlisted buffers. see :help buflisted
        unlisted_buffers = true,

        -- list of filetypes to ignore.
        filetypes = {},

        -- ignored buftypes.
        -- can be one of the following:
        -- false or nil - no buftypes are ignored.
        -- "special"    - all buffers other than normal buffers are ignored.
        -- table        - a list of buftypes to ignore. see :help buftype for the
        --                possible values.
        -- function     - a function that returns true if the buffer should be
        --                ignored or false if it should not be ignored.
        --                takes two arguments, `bufnr` and `buftype`.
        buftypes = "special",

        -- ignored wintypes.
        -- can be one of the following:
        -- false or nil - no wintypes are ignored.
        -- "special"    - all windows other than normal windows are ignored.
        -- table        - a list of wintypes to ignore. see :help win_gettype() for the
        --                possible values.
        -- function     - a function that returns true if the window should be
        --                ignored or false if it should not be ignored.
        --                takes two arguments, `winid` and `wintype`.
        wintypes = "special"
    },

    -- when you fold code with za, zo, or zc, update the aerial tree as well.
    -- only works when manage_folds = true
    link_folds_to_tree = false,

    -- fold code when you open/collapse symbols in the tree.
    -- only works when manage_folds = true
    link_tree_to_folds = false,

    -- use symbol tree for folding. set to true or false to enable/disable
    -- 'auto' will manage folds if your previous foldmethod was 'manual'
    manage_folds = false,

    -- these control the width of the aerial window.
    -- they can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a list of mixed types.
    -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
    max_width = {50},
    width = nil,
    min_width = 10,

    -- set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
    -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
    nerd_font = "auto",

    -- call this function when aerial attaches to a buffer.
    -- useful for setting keymaps. takes a single `bufnr` argument.
    on_attach = function(bufnr)
        -- toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a',
                                    '<cmd>AerialToggle!<cr>', {})
    end,

    -- automatically open aerial when entering supported buffers.
    -- this can be a function (see :help aerial-open-automatic)
    open_automatic = false,

    -- set to true to only open aerial at the far right/left of the editor
    -- default behavior opens aerial relative to current window
    placement_editor_edge = false,

    -- run this command after jumping to a symbol (false will disable)
    post_jump_cmd = "normal! zz",

    -- when true, aerial will automatically close after jumping to a symbol
    close_on_select = false,

    -- show box drawing characters for the tree hierarchy
    show_guides = true,

    -- the autocmds that trigger symbols update (not used for lsp backend)
    update_events = "textchanged,insertleave",

    -- customize the characters used when show_guides = true
    guides = {
        -- when the child item has a sibling below it
        mid_item = "├─",
        -- when the child item is the last in the list
        last_item = "└─",
        -- when there are nested child guides to the right
        nested_top = "│ ",
        -- raw indentation
        whitespace = "  "
    },

    -- options for opening aerial in a floating win
    float = {
        -- controls border appearance. passed to nvim_open_win
        border = "rounded",

        -- enum: cursor, editor, win
        --   cursor - opens float on top of the cursor
        --   editor - opens float centered in the editor
        --   win    - opens float centered in the window
        relative = "cursor",

        -- these control the height of the floating window.
        -- they can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_height and max_height can be a list of mixed types.
        -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
        max_height = 0.9,
        height = nil,
        min_height = {8, 0.1},

        override = function(conf)
            -- this is the config that will be passed to nvim_open_win.
            -- change values here to customize the layout
            return conf
        end
    },

    lsp = {
        -- fetch document symbols when lsp diagnostics update.
        -- if false, will update on buffer changes.
        diagnostics_trigger_update = true,

        -- set to false to not update the symbols when there are lsp errors
        update_when_errors = true,

        -- how long to wait (in ms) after a buffer change before updating
        -- only used when diagnostics_trigger_update = false
        update_delay = 300
    },

    treesitter = {
        -- how long to wait (in ms) after a buffer change before updating
        update_delay = 300
    },

    markdown = {
        -- how long to wait (in ms) after a buffer change before updating
        update_delay = 300
    }
})
