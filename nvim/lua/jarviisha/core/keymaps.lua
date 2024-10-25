-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
keymap.set("n", "<A-z>", ":set wrap!<CR>", opts)
keymap.set("n", "<C-n>", ":b#<CR>", opts)
