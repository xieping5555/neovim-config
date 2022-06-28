local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
local empty = {}

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
keymap('v', '<S-h>', '<Home>', empty)
keymap('v', '<S-l>', '<End>', empty)
keymap('v', '<leader>y', '"+yy', empty)
keymap('v', '<leader>p', '"+p', empty)
keymap('n', '<leader>y', '"+yy', empty)
keymap('n', '<leader>p', '"+p', empty)

-- nvim-tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- keymap('n', '<S-r>', ':NvimTreeRefresh<CR>', opts)
keymap('n', '<leader>c', ':NvimTreeFocus<CR>', opts)

-- window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- bufferline
keymap('n', '<C-j>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<C-k>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<space>1', ':BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<space>2', ':BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<space>3', ':BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<space>4', ':BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<space>5', ':BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<space>6', ':BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<space>7', ':BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<space>8', ':BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<space>9', ':BufferLineGoToBuffer 9<CR>', opts)
keymap('n', '<leader>x', ':BufferLinePickClose<CR>', opts)
keymap('n', '<C-p>', ':BufferLinePick<CR>', opts)

-- toggleterm
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('n', '<space>\'', ':ToggleTerm<CR>', opts)

-- telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fp', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fs', ':Telescope colorscheme<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>fr', ':Telescope grep_string<CR>', opts)
keymap('n', '<leader>fB', ':Telescope file_browser<CR>', opts)

-- accelerated-js
--[[ keymap('n', 'j', '<Plug>(accelerated_jk_gj)', empty)
keymap('n', 'k', '<Plug>(accelerated_jk_gk)', empty) ]]

-- easy-align
keymap('x', 'ga', '<Plug>(EasyAlign)', empty)
keymap('n', 'ga', '<Plug>(EasyAlign)', empty)

-- spectre
keymap('n', '<leader>sr', ':lua require("spectre").open()<CR>', opts)
-- search current word
keymap('n', '<leader>sw',
       ':lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap('n', '<space>s', ':lua require("spectre").open_visual()<CR>', opts)
-- search in current file
keymap('n', '<leader>sp', ':lua require("spectre").open_file_search()<CR>', opts)

-- go
keymap('n', '<space>tt', ':GoTestFunc<CR>', opts)
keymap('n', '<space>fs', ':GoFillStruct<CR>', opts)

-- floaterm
keymap('n', "<space>'", ':FloatermToggle! cd %:p:h<CR>', opts)

-- maximizer
keymap('n', "<C-b>", ':MaximizerToggle<CR>', opts)

-- 格式化代码
keymap('n', "<C-s>", ":Neoformat<CR>", opts)

-- debugger
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dB",
--        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
--        opts)
-- -- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
-- keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
-- keymap('n', '<F10>',
--        '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
-- keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap(wn", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)
