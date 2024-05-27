-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "flex-light",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
    cmp = {
        style = "atom_colored",
    },

    lsp = {
        signature = false,
    },

    transparency = false,

    nvdash = {
        load_on_startup = false,
    },

    statusline = {
        theme = "default",
    },
}

return M
