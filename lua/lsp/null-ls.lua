local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("nill-ls not found")
	return
end

local formatting = null_ls.builtins.formatting

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	autostart = true,
	sources = {
		-- Formatting ---------------------
		formatting.stylua, -- lua formatting
		formatting.shfmt, -- shell script formatting
		formatting.prettier, -- js formatting
		formatting.gofumpt, -- golang formatting
		formatting.goimports, -- golang formatting
		-- formatting.golines,
	},
	-- 保存自动格式化
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
