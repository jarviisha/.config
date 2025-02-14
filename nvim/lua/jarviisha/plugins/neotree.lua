return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim",
		-- {
		-- 	"s1n7ax/nvim-window-picker",
		-- 	version = "2.*",
		-- 	config = function()
		-- 		require("window-picker").setup({
		-- 			filter_rules = {
		-- 				include_current_win = false,
		-- 				autoselect_one = true,
		-- 				bo = {
		-- 					filetype = { "neo-tree", "neo-tree-popup", "notify" },
		-- 					buftype = { "terminal", "quickfix" },
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- },
	},
	config = function()
		vim.cmd([[ 
          "highlight NeoTreeNormal guibg=#1e1e2e
          "highlight NeoTreeEndOfBuffer guibg=#1e1e2e
          highlight NeoTreeRootName guifg=#ff9e64 gui=bold
          highlight NeoTreeFileName guifg=#d9e0ee
          highlight NeoTreeFileNameOpened guifg=#89dceb gui=bold
          highlight NeoTreeIndentMarker guifg=#6c7086
          highlight NeoTreeSymbolicLinkTarget guifg=#ff9e64
          highlight NeoTreeDirectoryIcon guifg=#7dcfff
          highlight NeoTreeDirectoryName guifg=#d9e0ee
        ]])

		vim.cmd([[highlight NeoTreeRootFolder guifg=#88C0D0 gui=bold]])
		vim.cmd([[highlight NeoTreeGitUntracked gui=bold guifg=#64a57c]])

		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						added = "A",
						modified = "M",
						deleted = "D",
						renamed = "R",

						untracked = "U",
						ignored = "",
						unstaged = "󰄱",
						staged = "S",
						conflict = "C",
					},
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
		})

		-- Kiểm tra xem Neotree có được focus không
		local function is_neotree_focused()
			local bufname = vim.api.nvim_buf_get_name(0)
			return string.match(bufname, "neo%-tree filesystem") ~= nil
		end

		-- Chuyển đổi giữa focus Neo-tree và quay lại split trước
		local function toggle_neotree_focus()
			if is_neotree_focused() then
				-- Nếu Neo-tree đang được focus, chuyển về split trước đó
				vim.cmd("wincmd p")
			else
				-- Nếu không, mở hoặc toggle Neo-tree
				vim.cmd(":Neotree focus<CR>")
			end
		end
		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

		vim.keymap.set("n", "<leader>e", function()
			toggle_neotree_focus()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ngs", ":Neotree float git_status<CR>", { noremap = true, silent = true })
	end,
}
