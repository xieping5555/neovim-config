-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ashes",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.ui = {
    cmp = {
        style = "atom_colored",
    },

    nvdash = {
        load_on_startup = false,
    },

    statusline = {
        theme = "default",
    },

    tabufline = {
        show_numbers = true,
    },
}

M.lsp = {
    signature = false,
}

M.mason = {
    pkgs = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "tsserver",
        "gopls",
        "pylyzer",
        "thriftls",
    },
}

return M
