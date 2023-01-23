local nvim_lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local mason = require("mason")
local lsp = require("lsp.lsp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local function on_attach(client, bufnr)
    lsp.bind_keymap(bufnr)
    lsp.highlight_document(client)
end


local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, server in ipairs(mason_lsp.get_installed_servers()) do
    if server == "sumneko_lua" then
        nvim_lsp.sumneko_lua.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {globals = {"vim", "packer_plugins"}},
                }
            }
        })
    elseif server == "gopls" then
        nvim_lsp.gopls.setup({
            on_attach = on_attach,
            flags = {debounce_text_changes = 500, allow_incremental_sync = false},
            capabilities = capabilities,
            cmd = {"gopls", "-remote=auto"},
            settings = {
                gopls = {
                    memoryMode = "DegradeClosed",
                    usePlaceholders = false,
                    analyses = {
                        nilness = true,
                        shadow = true,
                        unusedparams = true,
                        unusewrites = true
                    },
                    codelenses = {
                        generate = true
                    }
                }
            }
        })
    else
        nvim_lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
    end
end

mason.setup({
    ensure_installed = {
        "lua-language-server", "gopls", "pyright", "bash-language-server"
    }
})
