local lspkind = require('lspkind')
local cmp = require 'cmp'

local mapkey = function(cmp)
    return {
        -- 上一个，命令行模式和输入模式下有效
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),
        -- 下一个
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'})
    }
end
cmp_config = {
    -- lsp 图标
    formatting = {
        fields = {"kind", "abbr", "menu"},
        max_width = 0,
        kind_icons = {
            Class = " ",
            Color = " ",
            Constant = "ﲀ ",
            Constructor = " ",
            Enum = "練",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = "",
            Folder = " ",
            Function = " ",
            Interface = "ﰮ ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Operator = "",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = "塞",
            Value = " ",
            Variable = " "
        },
        source_names = {
            nvim_lsp = "(LSP)",
            emoji = "(Emoji)",
            path = "(Path)",
            calc = "(Calc)",
            cmp_tabnine = "(Tabnine)",
            vsnip = "(Snippet)",
            luasnip = "(Snippet)",
            buffer = "(Buffer)",
            spell = "(Spell)"
        },
        duplicates = {buffer = 1, path = 1, nvim_lsp = 0, luasnip = 1},
        duplicates_default = 0,
        format = function(entry, vim_item)
            local max_width = cmp_config.formatting.max_width
            if max_width ~= 0 and #vim_item.abbr > max_width then
                vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) ..
                                    "…"
            end
            vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
            vim_item.menu =
                cmp_config.formatting.source_names[entry.source.name]
            vim_item.dup =
                cmp_config.formatting.duplicates[entry.source.name] or
                    cmp_config.formatting.duplicates_default
            return vim_item
        end
    },

    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` users.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end
    },
    source_names = {
        nvim_lsp = "(LSP)",
        emoji = "(Emoji)",
        path = "(Path)",
        calc = "(Calc)",
        cmp_tabnine = "(Tabnine)",
        vsnip = "(Snippet)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        spell = "(Spell)"
    },
    -- 来源
    sources = {
        {name = "nvim_lsp"}, {name = "path"}, {name = "luasnip"},
        {name = "cmp_tabnine"}, {name = "nvim_lua"}, {name = "buffer"},
        {name = "spell"}, {name = "calc"}, {name = "emoji"},
        {name = "treesitter"}, {name = "crates"}
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    -- 快捷键
    mapping = mapkey(cmp)
    -- 使用lspkind-nvim显示类型图标
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         with_text = true, -- do not show text alongside icons
    --         maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --         before = function(entry, vim_item)
    --             -- Source 显示提示来源
    --             vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
    --             return vim_item
    --         end
    --     })
    -- }

}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

cmp.setup(cmp_config)