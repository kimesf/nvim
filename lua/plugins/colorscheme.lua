---- SETUP FOR NO CLOWN FIESTA THEME
-- return {
--   "aktersnurra/no-clown-fiesta.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("no-clown-fiesta").setup({})
--     vim.cmd.colorscheme("no-clown-fiesta")
--   end,
-- }

return {
  "zenbones-theme/zenbones.nvim",
  lazy = false,
  priority = 1000,
  dependencies = "rktjmp/lush.nvim",
  config = function()
    vim.cmd.colorscheme("zenbones")

    -- Darken background
    vim.api.nvim_set_hl(0, "Normal", { bg = "#13151c" })

    -- Softer colorcolumn
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#20232c" })

    -- Function definitions: bold white
    vim.api.nvim_set_hl(0, "@function", { fg = "#ffffff", bold = true })

    -- Function calls: bold yellow
    vim.api.nvim_set_hl(0, "@function.call", { fg = "#e5c07b", bold = true })

    -- Comments: green, bold
    vim.api.nvim_set_hl(0, "Comment", { fg = "#8aa889", bold = true })

    -- Good themes:
    -- vim.cmd.colorscheme("kanagawabones")
    -- vim.cmd.colorscheme("zenbones")
    -- vim.cmd.colorscheme("nordbones")
    -- vim.cmd.colorscheme("seoulbones")
  end,
}
