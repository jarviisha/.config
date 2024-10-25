return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
			local keymap = vim.keymap

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
				desc = "Fuzzy find files in cwd",
			})

			keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", {
				desc = "Fuzzy find files in cwd",
			})

			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {
				desc = "Fuzzy find recent files",
			})

			keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {
				desc = "Find string under cursor in cwd",
			})

			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
				desc = "Find todos",
			})
		end,
	},
}
