return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            width = 0.99,
            height = 0.99,
          },
        }
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob", "!**/.git/*",
              "--glob", "!**/vendor/*",
              "--glob", "!**/node_modules/*",
              "--glob", "!**/public/*",
              "--glob", "!**/tmp/*"
            },
            hidden = true,
            no_ignore = true,
          },
          live_grep = {
            additional_args = function(_opts)
              return {
                "--hidden",
                "--glob", "!**/.git/*",
                "--glob", "!**/vendor/*",
                "--glob", "!**/node_modules/*",
                "--glob", "!**/public/*",
                "--glob", "!**/tmp/*"
              }
            end,
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
