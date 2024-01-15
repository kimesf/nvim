local map = vim.keymap
local options = { noremap = true, silent = true }

map.set("i", "jk", "<Esc>", options)
map.set("i", "kj", "<Esc>", options)
map.set("i", "kj", "<Esc>", options)

map.set("n", "<C-h>", "<C-w>h", options)
map.set("n", "<C-j>", "<C-w>j", options)
map.set("n", "<C-k>", "<C-w>k", options)
map.set("n", "<C-l>", "<C-w>l", options)
