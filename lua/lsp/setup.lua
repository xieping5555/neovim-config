local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require 'lspconfig'
local _ = require 'lsp.nvim-cmp'

local lua_setting = function()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    return {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {enable = false}
            }
        }
    }
end

local servers = {sumneko_lua = lua_setting(), gopls = {}, pyright = {}}

-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

local maplsp = function(mapbuf)
    local opt = {}
    -- rename
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    mapbuf('n', '<space>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    mapbuf('n', '<space>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    mapbuf('n', '<space>lj', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    mapbuf('n', '<space>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', '<space>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- leader + =
    mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    mapbuf("n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
    mapbuf("n", "gx", "<cmd>Lspsaga code_action<cr>",
           {silent = true, noremap = true})
    mapbuf("x", "gx", ":<c-u>Lspsaga range_code_action<cr>",
           {silent = true, noremap = true})
    mapbuf("n", "K", "<cmd>Lspsaga hover_doc<cr>",
           {silent = true, noremap = true})
    mapbuf("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>",
           {silent = true, noremap = true})
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>",
           {silent = true, noremap = true})
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
           {silent = true, noremap = true})
    mapbuf("n", "<C-u>",
           "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
           {})
    mapbuf("n", "<C-d>",
           "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
           {})
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local opts = servers[server.name]
    if opts then
        opts.on_attach = function(client, bufnr)
            local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end
            -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
            -- 绑定快捷键
            maplsp(buf_set_keymap)
            require("aerial").on_attach(client, bufnr)
        end
        opts.flags = {debounce_text_changes = 150}
        server:setup(opts)
    end
end)
