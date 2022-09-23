local status_ok, mason = pcall(require, "mason")
if not status_ok then
    vim.notify("mason not found!")
    return
end

local nvim_lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")

mason.setup()
mason.setup({
    ensure_installed = {
        "lua-language-server", "gopls", "pyright", "bash-language-server"
    }
})

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities
for _, server in ipairs(mason_lsp.get_installed_servers()) do
    if server == "gopls" then
        nvim_lsp.gopls.setup({
            on_attach = on_attach,
            flags = {debounce_text_changes = 500},
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
    elseif server == "sumneko_lua" then
        nvim_lsp.sumneko_lua.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {globals = {"vim", "packer_plugins"}},
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000
                    },
                    telemetry = {enable = false}
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
