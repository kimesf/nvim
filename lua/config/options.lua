vim.g.mapleader = " "

local opt = vim.opt
local alacritty_red = "#ac4142"

local function highlight_trailing_spaces()
  vim.cmd("highlight TrailingSpace guibg=" .. alacritty_red)
  vim.cmd("match TrailingSpace /\\s\\+$/")
end

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.colorcolumn = { 80, 120 }
opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = highlight_trailing_spaces,
})
