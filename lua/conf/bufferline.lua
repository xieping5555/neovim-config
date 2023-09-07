vim.opt.termguicolors = true
require("bufferline").setup({
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
