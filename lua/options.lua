local o = vim.o
local g = vim.g
local cmd = vim.api.nvim_command
-- 显示行号
o.number = true
-- 设置tab长度为4个空格
o.tabstop = 4
-- 设置自动缩进长度为4个空格
o.shiftwidth = 4
-- tab替换成空格
o.expandtab = true
-- 自动缩进，继承前一行的缩进方式
o.autoindent = true
-- 开启真彩配置
o.termguicolors = true
-- o.t_Co = 256
-- 突出显示当前行
o.cursorline = false
-- 显示括号匹配
o.showmatch = true
-- 搜索忽略大小写
o.ignorecase = true
-- 实时搜索
o.incsearch = true
-- 如果有一个大写字母，则大小写敏感查找
o.smartcase = true
-- 高亮搜索关键词
o.hlsearch = true
-- 退出确认
o.confirm = true
-- 保持在光标上下的最小行数
o.scrolloff = 10
-- 文件换行符，默认使用unix换行符
o.ffs = "unix,dos,mac"
-- 不要swap文件
o.swapfile = false
-- 不要备份文件
o.backup = false
-- 背景颜色
o.background = "dark"
-- o.background = "light"
o.hidden = true
-- 新分割的窗口在右边
o.splitright = true

-- leader键配置
g.mapleader = "\\"

local colorscheme = "nord"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.g.floaterm_wintype = "split"
vim.g.floaterm_position = "botright"
vim.g.floaterm_height = 20
vim.g.floaterm_shell = "zsh"

vim.g.transparent_enable = false

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*.thrift",
	callback = function()
		vim.cmd(" !thriftls -format -f % -w")
	end,
})

-- vim.g.clipboard = {
-- 	name = "OSC 52",
-- 	copy = {
-- 		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
-- 	},
-- 	paste = {
-- 		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
-- 	},
-- }
