local M = {}

local compare = require "cmp.config.compare"

M.cmp = {
    sorting = {
        comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.locality,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
    completion = {
        completeopt = "menu,menuone,preview",
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        -- { name = "codeverse" },
    },
    experimental = {
        ghost_text = true,
    },
}

M.nvim_tree = {
    view = {
        width = {},
    },
}

return M
