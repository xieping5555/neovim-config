local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
	vim.notify("lspsaga not found")
	return
end
lspsaga.setup({
	lightbulb = {
		enable = false,
		sign = false,
	},
	code_action = {
		show_server_name = true,
		extend_gitsigns = false,
	},
})
