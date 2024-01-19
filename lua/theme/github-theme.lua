require("github-theme").setup({
	options = {
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			functions = "standout,bold",
			keywords = "NONE",
			variables = "NONE",
			conditionals = "NONE",
			constants = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "bold",
			methods = "NONE",
		},
	},
})
