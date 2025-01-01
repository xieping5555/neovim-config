-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local capabilities = require("blink.cmp").get_lsp_capabilities()
-- local on_attach = require("blink.cmp").on_attach
-- local on_init = require("blink.cmp").on_init

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "gopls", "thriftls", "pylyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end
