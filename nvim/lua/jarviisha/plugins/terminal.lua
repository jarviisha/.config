return {
	{
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = function()
				require("toggleterm").setup({
					size = 20,
					open_mapping = [[<C-_>]], -- Tổ hợp phím mở terminaltermia
					direction = "horizontal", -- Kiểu terminal (vertical, horizontal, float)
					close_on_exit = true, -- Đóng terminal sau khi thoát
					shell = "powershell.exe", -- Đặt PowerShell làm shell mặc định
				})
			end,
		},
	},
}
