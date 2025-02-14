return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			window = {
				-- completion = cmp.config.window.bordered(), -- Hộp gợi ý
				-- documentation = cmp.config.window.bordered(), -- Hộp tài liệu
				completion = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Có thể thêm viền
					scrollbar = false, -- Tắt thanh scrollbar
				},
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Có thể thêm viền
					scrollbar = false, -- Tắt thanh scrollbar
				},
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = {
						menu = 50, -- leading text (labelDetails)
						abbr = 50, -- actual suggestion item
					},
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(entry, vim_item)
						-- ...
						return vim_item
					end,
				}),
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					select = false,
				}),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
				},
				{
					name = "luasnip",
				},
				{
					name = "buffer",
				},
				{
					name = "path",
				},
			}),
			experimental = {
				ghost_text = true,
			},
		})
	end,
}
