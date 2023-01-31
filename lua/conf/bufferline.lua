vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "FILE EXPLORER",
				text_align = "center",
				separator = false,
			},
		},
	},
})
