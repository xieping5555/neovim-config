local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("nvim-tree not found!")
    return
end

local keylist = {
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
    {key = {"O"}, action = "edit_no_picker"},
    {key = {"<2-RightMouse>", "<C-]>"}, action = "cd"},
    {key = "v", action = "vsplit"}, {key = "s", action = "split"},
    {key = "<C-t>", action = "tabnew"}, {key = "<", action = "prev_sibling"},
    {key = ">", action = "next_sibling"}, {key = "P", action = "parent_node"},
    {key = "<BS>", action = "close_node"}, {key = "<Tab>", action = "preview"},
    {key = "K", action = "first_sibling"}, {key = "J", action = "last_sibling"},
    {key = "I", action = "toggle_ignored"},
    {key = "H", action = "toggle_dotfiles"}, {key = "R", action = "refresh"},
    {key = "a", action = "create"}, {key = "d", action = "remove"},
    {key = "D", action = "trash"}, {key = "r", action = "rename"},
    {key = "<C-r>", action = "full_rename"}, {key = "x", action = "cut"},
    {key = "c", action = "copy"}, {key = "p", action = "paste"},
    {key = "y", action = "copy_name"}, {key = "Y", action = "copy_path"},
    {key = "gy", action = "copy_absolute_path"},
    {key = "[c", action = "prev_git_item"},
    {key = "]c", action = "next_git_item"}, {key = "-", action = "dir_up"},
    {key = "S", action = "system_open"}, {key = "q", action = "close"},
    {key = "H", action = "toggle_help"}
}
tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = true,
    hijack_directories = {enable = true, auto_open = true},
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    git = {enable = true, ignore = true, timeout = 500},
    view = {
        adaptive_size = true,
        -- width = 40,
        -- height = 30,
        hide_root_folder = false,
        -- side = 'left',
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
