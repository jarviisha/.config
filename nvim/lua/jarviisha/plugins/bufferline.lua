return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset.no_italic,
					separator_style = { "" },
					show_buffer_close_icons = true,
					-- tab_size = 20,
					show_close_icon = false,
					indicator = {
						style = "underline", -- Options: 'icon', 'underline', 'none'
					},
					offsets = {
						{
							filetype = "neo-tree",
							text = "🌊🌊 FILE EXPLORER",
							text_align = "left",
							separator = true,
							highlight = "Directory",
						},
					},
				},
				highlights = {
					separator = {
						fg = "#434C5E",
					},
					buffer_selected = {
						-- bg = "#4C566A",
						fg = "#e4e3e1",
						bold = true,
					},
				},
			})

			-- Tắt buffer hiện tại và chuyển sang buffer gần nhất
			local function close_current_buffer()
				-- Lưu buffer gần nhất
				local current_buffer = vim.api.nvim_get_current_buf()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })

				-- Tìm buffer gần nhất
				local closest_buffer = nil
				for _, buf in ipairs(buffers) do
					if buf.bufnr ~= current_buffer then
						closest_buffer = buf.bufnr
						break
					end
				end

				-- Nếu có buffer gần nhất, tắt buffer hiện tại và chuyển đến buffer đó
				if closest_buffer then
					vim.api.nvim_buf_delete(current_buffer, { force = true })
					vim.api.nvim_set_current_buf(closest_buffer)
				end
			end

			-- Đóng buffer đang focus
			vim.keymap.set("n", "<leader>bd", function()
				close_current_buffer()
			end, { noremap = true, silent = true })
			-- Đóng buffer hiện tại
			vim.keymap.set("n", "<leader>0", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })

			-- Chọn buffer theo tên
			vim.keymap.set("n", "<leader>b", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })

			-- Đóng buffer hiện tại
			vim.keymap.set("n", "<leader>q", "<Cmd>bdelete<CR>", { noremap = true, silent = true })

			-- Di chuyển giữa các buffer
			vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
		end,
	},
}
