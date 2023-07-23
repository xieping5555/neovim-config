local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- base
keymap("n", "<S-h>", "<Home>", opts)
keymap("n", "<S-l>", "<End>", opts)
keymap("v", "<S-h>", "<Home>", opts)
keymap("v", "<S-l>", "<End>", opts)
keymap("v", "<leader>y", '"+yy', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("n", "<leader>y", '"+yy', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<space>y", 'bve"+y', opts)
keymap("n", "<space>p", 'bve"+p', opts)
keymap("n", "<space>w", ":w<CR>", opts)
keymap("n", "q", ":q<CR>", opts)
keymap("n", "<space>q", ":qa<CR>", opts)
keymap("n", "<leader>s", ":sp<CR>", opts)
keymap("n", "<leader>v", ":vsp<CR>", opts)
keymap("n", "<space>nh", ":noh<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fp", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fg", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>fr", ":Telescope oldfiles<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<S-r>", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>c", ":NvimTreeFindFile<CR>", opts)

-- lspsaga
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
keymap("n", "<leader>at", "<cmd>Lspsaga outline<CR>", opts)

-- floaterm
keymap("n", "<space>'", ":FloatermToggle! cd %:p:h<CR>", opts)
keymap("t", "<esc>", [[<C-\><C-n>]], opts)

--zen mode
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- search box
keymap("n", "<leader>f", "<cmd>SearchBoxMatchAll<CR>", opts)
keymap("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", opts)

-- fold
keymap("n", "zm", ":foldclose<CR>", opts)
keymap("n", "zr", ":foldopen<CR>", opts)
