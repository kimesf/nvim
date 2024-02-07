return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 2 }, 'location', 'progress' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = {}
      },
    })
  end,
}
