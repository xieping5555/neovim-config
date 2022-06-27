local status_ok, tidy = pcall(require, "tidy")
if not status_ok then
    vim.notify("tidy module not found!")
    return
end
tidy.setup({filetype_exclude = {"markdown", "python"}})
