local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("nvim-lspconfig not found!")
    return
end

-- NOTE: 如果发现某些lsp server安装启动时出现， client exit x and signal 0 等错误
-- 可能是因为node版本过低， 升级node版本即可
-- 升级方法
-- npm cache clean -f
-- npm install -g n
-- n stable

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- 下载安装lsp server
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
        flags = {debounce_text_changes = 150}
    }

    if server.name == "golang" then
        local golang_opts = require("lsp.settings.golang")
        opts = vim.tbl_deep_extend("force", golang_opts)
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
