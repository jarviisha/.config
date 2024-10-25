return {
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				hint_enable = false, -- tắt gợi ý tự động
				floating_window = true, -- bật cửa sổ nổi để hiển thị thông tin hàm
				hi_parameter = "IncSearch", -- highlight tham số đã được truyền
			})
		end,
	},
}
