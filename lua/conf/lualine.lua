-- local a = require("lualine.themes.tundra")
-- a.normal.c.bg = "None"
local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("lualine not found")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		-- themes = "",
		themes = "ayu",
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree" },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "lsp_progress" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
