vim.opt.termguicolors = true

local ok, bufferline = pcall(require, "bufferline")
if not ok then
	vim.notify("bufferline not found")
	return
end

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		separator_style = "thick",
	},
})
