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
    -- Good themes:
    -- vim.cmd.colorscheme("kanagawabones")
    -- vim.cmd.colorscheme("zenbones")
    -- vim.cmd.colorscheme("nordbones")
    -- vim.cmd.colorscheme("seoulbones")
  end,
}
