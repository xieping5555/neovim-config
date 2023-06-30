local telescope = require("telescope")

telescope.setup({
	file_ignore_patterns = { "^thrift_gen/", "^kitex_gen/" },
})

telescope.load_extension("live_grep_args")
