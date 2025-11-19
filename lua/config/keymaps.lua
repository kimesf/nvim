local map = vim.keymap
local options = { noremap = true, silent = true }

-- Save file quickly
map.set("n", "<leader>w", ":update<CR>", options)

-- Exit insert mode quickly
map.set("i", "jk", "<Esc>", options)
map.set("i", "kj", "<Esc>", options)

-- Better window navigation
map.set("n", "<C-h>", "<C-w>h", options)
map.set("n", "<C-j>", "<C-w>j", options)
map.set("n", "<C-k>", "<C-w>k", options)
map.set("n", "<C-l>", "<C-w>l", options)

-- Clear search highlights
map.set("n", "<leader>l", ":noh<CR>", options)

-- Paste without yanking
map.set("v", "<leader>p", '"_dP', options)

-- Copy selected text in visual mode to system clipboard
map.set("v", "<leader>y", '"+y', options)

-- Copy current line in normal mode to system clipboard
map.set("n", "<leader>Y", '"+yy', options)
