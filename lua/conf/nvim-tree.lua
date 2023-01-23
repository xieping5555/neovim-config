require'nvim-tree'.setup{
    hijack_cursor = true, 
    open_on_setup=true, -- open tree when first open
    auto_reload_on_write=true,
    git = {enable = true, ignore = true, timeout = 500},
    filters = {dotfiles = true, custom = {}, exclude = {'.gitignore'}},
    view = {
        adaptive_size = true,
        -- width = 40,
        -- height = 30,
        hide_root_folder = true,
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    }
}
