return {
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = "2"
			vim.g.sonokai_enable_italic = "0"
			vim.g.sonokai_float_style = "dim"
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#354157", bg = "None" })
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require("solarized-osaka").setup({
			-- 	transparent = true,
			-- 	styles = {
			-- 		keywords = { italic = false },
			-- 		sidebars = "transparent",
			-- 		floats = "transparent",
			-- 	},
			-- })
			-- vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,

		-- config = function()
		-- 	require("cyberdream").setup({
		-- 		transparent = true,
		-- 		borderless_telescope = false,
		-- 	})
		-- 	vim.cmd("colorscheme cyberdream")
		-- end,
	},
}
