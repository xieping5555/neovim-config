local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("telescope module not found!")
    return
end

telescope.setup {}
telescope.load_extension("file_browser")
