local ok, hlchunk = pcall(require, "hlchunk")
if not ok then
	vim.notify("hlchunk not found")
	return
end

hlchunk.setup({
	indent = {
		chars = { "│", "¦", "┆", "┊" },

		style = {
			-- "#8B00FF",
			"#40A9FF",
			-- "#81FF95",
		},
	},
	blank = {
		enable = false,
	},
})
