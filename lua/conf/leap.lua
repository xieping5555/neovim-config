local ok, leap = pcall(require, "leap")
if not ok then
	vim.notify("leap not found")
	return
end

leap.add_default_mappings()
