local M = {}

local compare = require "cmp.config.compare"
local types = require "cmp.types"

local modified_priority = {
    [types.lsp.CompletionItemKind.Variable] = types.lsp.CompletionItemKind.Method,
    [types.lsp.CompletionItemKind.Snippet] = 0, -- top
    [types.lsp.CompletionItemKind.Keyword] = 0, -- top
    [types.lsp.CompletionItemKind.Text] = 100, -- bottom
}

local function modified_kind(kind)
    return modified_priority[kind] or kind
end

M.cmp = {
    sorting = {
        comparators = {
            compare.offset,
            compare.exact,
            function(entry1, entry2) -- sort by length ignoring "=~"
                local len1 = string.len(string.gsub(entry1.completion_item.label, "[=~()_]", ""))
                local len2 = string.len(string.gsub(entry2.completion_item.label, "[=~()_]", ""))
                if len1 ~= len2 then
                    return len1 - len2 < 0
                end
            end,
            compare.recently_used,
            function(entry1, entry2) -- sort by compare kind (Variable, Function etc)
                local kind1 = modified_kind(entry1:get_kind())
                local kind2 = modified_kind(entry2:get_kind())
                if kind1 ~= kind2 then
                    return kind1 - kind2 < 0
                end
            end,
            function(entry1, entry2) -- score by lsp, if available
                local t1 = entry1.completion_item.sortText
                local t2 = entry2.completion_item.sortText
                if t1 ~= nil and t2 ~= nil and t1 ~= t2 then
                    return t1 < t2
                end
            end,
            compare.score,
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

return M
