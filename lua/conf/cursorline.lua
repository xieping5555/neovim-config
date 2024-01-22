local ok, cursorline = pcall(require, "nvim-cursorline")
if not ok then
	vim.notify("nvim-cursorline not found")
	return
end

cursorline.setup({
	cursorline = {
		enable = true,
		timeout = 0,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	},
})
