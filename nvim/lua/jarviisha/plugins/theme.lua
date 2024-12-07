return {
	{
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = "2"
			vim.g.sonokai_enable_italic = "0"
			vim.g.sonokai_float_style = "dim"
			vim.g.sonokai_style = "andromeda"
			-- vim.cmd.colorscheme("sonokai")
			-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#354157", bg = "None" })
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				bold_vert_split = true, -- use bold vertical separators
				dim_nc_background = true, -- dim 'non-current' window backgrounds
				disable_background = true, -- disable background
				disable_float_background = true, -- disable background for floats
				disable_italics = false, -- disable italics
			})
		end,

		-- optionally set the colorscheme within lazy config
		-- init = function()
		-- 	vim.cmd("colorscheme poimandres")
		-- 	-- vim.cmd("highlight Comment guifg=#bbc34d")
		-- end,
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
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local nor = require("nordic")
			nor.setup({
				transparent = {
					bg = true,
					float = true,
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = "classic",
				},
				bright_border = true,
			})
			-- nor.load()
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}
