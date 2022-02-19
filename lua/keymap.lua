local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- base
keymap('n', '<space>w', ':w<CR>', opts)
keymap('n', 'q', ':q<CR>', opts)
keymap('n', '<space>q', ':qa<CR>', opts)
keymap('n', '<leader>s', ':sp<CR>', opts)
keymap('n', '<leader>v', ':vsp<CR>', opts)
keymap('n', '<space>nh', ':noh<CR>', opts)
keymap('n', '<space>y', 'bve"+y', opts)
keymap('n', '<space>p', 'bve"+p', opts)
keymap('n', '<S-h>', '<Home>', opts)
keymap('n', '<S-l>', '<End>', opts)
keymap('v', '<S-h>', '<Home>', {silent = true})
keymap('v', '<S-l>', '<End>', {silent = true})

-- nvim-tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
keymap('n', '<S-r>', ':NvimTreeRefresh<CR>', opts)

-- window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- barbar
keymap('n', '<space>h', ':BufferPrevious<CR>', opts)
keymap('n', '<space>l', ':BufferNext<CR>', opts)
keymap('n', '<space>1', ':BufferGoto 1<CR>', opts)
keymap('n', '<space>2', ':BufferGoto 2<CR>', opts)
keymap('n', '<space>3', ':BufferGoto 3<CR>', opts)
keymap('n', '<space>4', ':BufferGoto 4<CR>', opts)
keymap('n', '<space>5', ':BufferGoto 5<CR>', opts)
keymap('n', '<space>6', ':BufferGoto 6<CR>', opts)
keymap('n', '<space>7', ':BufferGoto 7<CR>', opts)
keymap('n', '<space>8', ':BufferGoto 8<CR>', opts)
keymap('n', '<space>9', ':BufferGoto 9<CR>', opts)
keymap('n', '<space>0', ':BufferLast<CR>', opts)
keymap('n', '<space>c', ':BufferClose<CR>', opts)
keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<C-p>', ':BufferPick<CR>', opts)

-- toggleterm
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('n', '<space>,', ':ToggleTerm<CR>', opts)

-- telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fp', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fs', ':Telescope colorscheme<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- lsp
