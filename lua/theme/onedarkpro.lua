local ok, onedarkpro = pcall(require, "onedarkpro")
if not ok then
	vim.notify("onedarkpro not found")
	return
end
onedarkpro.setup({
	styles = {
		types = "bold",
		methods = "bold",
		numbers = "NONE",
		strings = "NONE",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "NONE",
		variables = "NONE",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "NONE",
	},
})
