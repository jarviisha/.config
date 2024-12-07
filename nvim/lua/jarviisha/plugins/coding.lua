return {
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				hint_enable = false, -- tắt gợi ý tự động
				floating_window = true, -- bật cửa sổ nổi để hiển thị thông tin hàm
				hi_parameter = "IncSearch", -- highlight tham số đã được truyền
				handler_opts = {
					border = "double",
					-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
			})
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1E1E2E" }) -- Nền của popup
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#FFD700" }) -- Màu viền
		end,
	},
}
