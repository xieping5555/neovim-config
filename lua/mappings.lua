require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<S-h>", "<Home>", { desc = "Go to start of line" })
map("n", "<S-l>", "<End>", { desc = "Go to end of line" })
map("v", "<S-h>", "<Home>", { desc = "Go to start of line" })
map("v", "<S-l>", "<End>", { desc = "Go to end of line" })
map("n", "dd", '"+dd')
map("v", "d", '"+d')
map("v", "y", '"+yy')
map("v", "p", '"+p')
map("n", "y", '"+yy')
map("n", "p", '"+p')
map("v", "<leader>y", '"+yy')
map("v", "<leader>p", '"+p')
map("n", "<leader>y", '"+yy')
map("n", "<leader>p", '"+p')
map("n", "<space>y", 'bve"+y')
map("n", "<space>p", 'bve"+p')
map("n", "<space>w", ":w<CR>")
map("n", "q", ":q<CR>")
map("n", "<space>q", ":qa<CR>")
map("n", "<leader>s", ":sp<CR>")
map("n", "<leader>v", ":vsp<CR>")
map("n", "<space>nh", ":noh<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>")
map("n", "<leader>gf", "<cmd>LazyGitFilter<CR>")

-- term
map({ "n", "t" }, "<space>'", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

-- nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>c", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- lspsaga
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("n", "<leader>gr", "<cmd>Lspsaga rename<CR>")
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "gf", "<cmd>Lspsaga finder<CR>")
map("n", "<leader>at", "<cmd>Lspsaga outline<CR>")

-- diffview
map("n", "<leader>do", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>")
