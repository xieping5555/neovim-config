local ok, cmp = pcall(require, "cmp")
if not ok then
	vim.notify("cmp not found")
	return
end

local ok2, lspkind = pcall(require, "lspkind")
if not ok2 then
	vim.notify("lspkind not found")
	return
end

local mapkey = function(cmp)
	return {
		-- 上一个，命令行模式和输入模式下有效
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		-- 下一个
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		-- 出现补全
		["<C-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 确认
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

local borderstyle = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
}

local symbolMap = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

cmp_config = {
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `luasnip` users.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	source_names = {
		nvim_lsp = "(LSP)",
		path = "(Path)",
		luasnip = "(Snippet)",
		buffer = "(Buffer)",
	},
	-- 来源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "luasnip" }, -- For luasnip user
		{ name = "buffer" }, -- For buffer word completion
		{ name = "path" }, -- For path completion
	}),
	window = {
		completion = borderstyle,
		documentation = borderstyle,
	},
	view = {
		docs = {
			auto_open = true,
		},
	},
	-- 快捷键
	mapping = mapkey(cmp),
	completion = {
		completeopt = "menu,menuone,preview",
	},
	formatting = {
		-- fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- Source 显示提示来源
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end,
		}),
	},
}

-- Use buffer source for `/`.
cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

cmp.setup(cmp_config)
