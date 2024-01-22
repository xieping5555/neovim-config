local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("telescope not found")
	return
end

telescope.setup({
	file_ignore_patterns = { "^thrift_gen/", "^kitex_gen/" },
	defaults = {
		-- prompt_prefix = "   ",
		-- sorting_strategy = "descending",
	},
})

telescope.load_extension("live_grep_args")
