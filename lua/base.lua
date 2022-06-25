local dashboard = require 'editor.dashboard'
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
-- 开启主题配置
o.termguicolors = true
o.t_Co = 256
-- 突出显示当前行
o.cursorline = true
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

-- 保存时自动清除尾部空白符
-- cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- leader键配置
g.mapleader = "\\"

-- cmd([[colorscheme darkblue]])
-- cmd([[colorscheme everblush]])
-- cmd([[colorscheme dracula]])
vim.g.ayucolor = "mirage"
cmd([[colorscheme ayu]])
-- cmd([[colorscheme onedark]])
-- cmd([[colorscheme spaceduck]])
-- cmd([[colorscheme shine]])
-- cmd([[colorscheme srcery]])
-- cmd([[colorscheme xcodelight]])
-- cmd([[colorscheme duckbones]])
-- cmd([[colorscheme gotham256]])
-- cmd([[colorscheme gruvbox-baby]])
-- cmd([[colorscheme shirotelin]])
-- cmd([[colorscheme wwdc17]])
-- cmd([[colorscheme OceanicNext]])
-- cmd([[colorscheme github_light]])
-- cmd([[colorscheme onedarkpro]])
-- cmd([[colorscheme gruvbox]])

vim.g.dashboard_default_executive = 'telescope'
vim.g.indentLine_fileTypeExclude = 'dashboard'
vim.g.dashboard_custom_header = dashboard.dashboard_custom_header9

vim.g.preview_uml_url = 'http://localhost:8888'

vim.g.floaterm_wintype = 'split'
vim.g.floaterm_position = 'botright'
vim.g.floaterm_height = 20

-- 保存时自动格式化go代码
-- cmd([[au BufWritePre * undojoin | Neoformat]])
