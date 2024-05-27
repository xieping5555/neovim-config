local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    formatters = {
        golines = {
            inherit = false,
            command = "golines",
            args = { "--max-len", 140 },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
