return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			-- local ui = require("dapui")

			require("dapui").setup()

			require("nvim-dap-virtual-text").setup({
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

			vim.api.nvim_set_keymap(
				"n",
				"<F9>",
				':lua require"dap".toggle_breakpoint()<CR>',
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap("n", "<F5>", ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<S-F5>",
				':lua require"dap".terminate()<CR>',
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<F10>",
				':lua require"dap".step_over()<CR>',
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<F12>",
				':lua require"dap".step_into()<CR>',
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<S-F12>",
				':lua require"dap".step_out()<CR>',
				{ noremap = true, silent = true }
			)

			-- Map phím F4 để chạy lại phiên debug từ đầu (Restart, tương đương với VSCode)
			vim.api.nvim_set_keymap("n", "<F4>", ':lua require"dap".restart()<CR>', { noremap = true, silent = true })

			-- dap.listeners.before.attach.dapui_config = function()
			-- 	ui.open()
			-- end
			-- dap.listeners.before.launch.dapui_config = function()
			-- 	ui.open()
			-- end
			-- dap.listeners.before.event_terminated.dapui_config = function()
			-- 	ui.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			-- 	ui.close()
			-- end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>dt",
				':lua require"dapui".toggle()<CR>',
				{ noremap = true, silent = true }
			)
		end,
	},
}
