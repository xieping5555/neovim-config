local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require "lsp.lsp-installer"
require"lsp.handlers".setup()
require "lsp.fidget"
require "lsp.lsp-saga"
-- require("user.lsp.null-ls")
-- require("user.lsp.lsp-utils")
