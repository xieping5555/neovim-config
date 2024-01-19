local telescope = require("telescope")

telescope.setup({
	file_ignore_patterns = { "^thrift_gen/", "^kitex_gen/" },
	defaults = {
		-- prompt_prefix = "   ",
		-- sorting_strategy = "descending",
	},
})

telescope.load_extension("live_grep_args")
