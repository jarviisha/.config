return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			null_ls.setup({
				sources = {
					formatting.goimports,
					-- null_ls.builtins.diagnostics.eslint_d.with({
					-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
					-- }),
					null_ls.builtins.diagnostics.fish,
				},
				on_attach = function(client)
					if client.server_capabilities.documentFormattingProvider then
						vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
					end
				end,
			})
		end,
	},
}
