-- Note: The order matters: mason -> mason-lspconfig -> lspconfig
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer

local function on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- local opts = { noremap = true, silent = false }
	-- local keymap = vim.api.nvim_buf_set_keymap
	--
	-- keymap(bufnr, "n", "gl", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- keymap(bufnr, "n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- keymap(bufnr, "n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- keymap(bufnr, "n", "<space>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- keymap(bufnr, "n", "<space>o", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- keymap(bufnr, "n", "dj", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- keymap(bufnr, "n", "dk", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- keymap(bufnr, "n", "df", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- keymap(bufnr, "n", "ds", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	--
	-- vim.cmd([[ command! Format execute ':lua vim.lsp.buf.formatting()' ]])

	require("lsp_signature").on_attach()
end

for _, server in ipairs(mason_lsp.get_installed_servers()) do
	if server == "sumneko_lua" then
		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim", "packer_plugins" } },
				},
			},
		})
	elseif server == "gopls" then
		lspconfig.gopls.setup({
			on_attach = on_attach,
			flags = { debounce_text_changes = 500, allow_incremental_sync = false },
			cmd = {
				"gopls",
				"-remote=auto",
				"-debug=localhost:8080",
				"-logfile=/home/xieping.ekko/gopls.log",
				"-remote.logfile=/home/xieping.ekko/gopls.remote.log",
			},
			settings = {
				gopls = {
					memoryMode = "DegradeClosed",
					usePlaceholders = false,
					analyses = {
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusewrites = true,
					},
					codelenses = {
						generate = true,
					},
				},
			},
		})
	else
		lspconfig[server].setup({
			on_attach = on_attach,
		})
	end
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	ensure_installed = {
		"lua_ls",
		"gopls",
		"pylsp",
		"bashls",
	},
})
