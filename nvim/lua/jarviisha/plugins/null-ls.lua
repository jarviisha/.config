return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			null_ls.setup({
				sources = {
					formatting.goimports,
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
