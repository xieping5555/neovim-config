local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

-- base
keymap('n', '<S-h>', '<Home>', opts)
keymap('n', '<S-l>', '<End>', opts)
keymap('v', '<S-h>', '<Home>', opts)
keymap('v', '<S-l>', '<End>', opts)
keymap('v', '<leader>y', '"+yy', opts)
keymap('v', '<leader>p', '"+p', opts)
keymap('n', '<leader>y', '"+yy', opts)
keymap('n', '<leader>p', '"+p', opts)
keymap('n', '<space>y', 'bve"+y', opts)
keymap('n', '<space>p', 'bve"+p', opts)
keymap('n', '<space>w', ':w<CR>', opts)
keymap('n', 'q', ':q<CR>', opts)
keymap('n', '<space>q', ':qa<CR>', opts)
keymap('n', '<leader>s', ':sp<CR>', opts)
keymap('n', '<leader>v', ':vsp<CR>', opts)
keymap('n', '<space>nh', ':noh<CR>', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- nvim-tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
keymap('n', '<S-r>', ':NvimTreeRefresh<CR>', opts)
keymap('n', '<leader>c', ':NvimTreeFocus<CR>', opts)

-- telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fp', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fs', ':Telescope colorscheme<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>fr', ':Telescope grep_string<CR>', opts)

-- toggleterm
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('n', '<space>\'', ':FloatermToggle<CR>', opts)
