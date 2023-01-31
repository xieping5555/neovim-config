require("nvim-tree").setup({
	hijack_cursor = true,
	-- open_on_setup = true, -- open tree when first open
	auto_reload_on_write = true,
	git = { enable = true, ignore = true, timeout = 500 },
	filters = { dotfiles = true, custom = {}, exclude = { ".gitignore" } },
	view = {
		adaptive_size = true,
		-- width = 40,
		-- height = 30,
		hide_root_folder = true,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
})

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		require("nvim-tree.api").tree.open()
		return
	end

	-- create a new, empty buffer
	vim.cmd.enew()

	-- wipe the directory buffer
	vim.cmd.bw(data.buf)

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
