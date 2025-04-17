-- EXAMPLE
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local capabilities = require("blink.cmp").get_lsp_capabilities()
-- local on_attach = require("blink.cmp").on_attach
-- local on_init = require("blink.cmp").on_init

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "gopls", "thriftls", "pylyzer" }

local on_attach = function(_, bufnr)
    local map = vim.keymap.set

    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
    map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
    -- map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
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
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gd", vim.lsp.buf.definition)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

-- define gutter diagnose icons
-- vim.diagnostic.config {
--     signs = {
--         text = {
--             [vim.diagnostic.severity.ERROR] = "",
--             [vim.diagnostic.severity.WARN] = "",
--             [vim.diagnostic.severity.HINT] = "󰍨",
--             [vim.diagnostic.severity.INFO] = "󰋼",
--         },
--         priority = 10,
--         -- 符号名称（用于高亮组，如 `DiagnosticSignError`）
--         name = {
--             [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
--             [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
--             [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
--             [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
--         },
--     },
-- }
--
-- -- 设置符号颜色
-- vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff5555" })
-- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffb86c" })
-- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#8be9fd" })
-- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#50fa7b" })

-- define gutter diagnose icons
local signs = {
    Error = "",
    Warning = "",
    Hint = "󰍨",
    Information = "󰋼",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
