return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "dockerls",
          "docker_compose_language_service",
          "ts_ls",
          "eslint",
          "terraformls",
        }
      })
    end
  },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig")

      -- Configure and enable LSP server if the executable is available in PATH
      -- @param executable string: The executable name to check (e.g., "ruby-lsp")
      -- @param lsp_name string: The LSP server name (e.g., "ruby_lsp")
      -- @param config table: Optional configuration table for vim.lsp.config
      local function setup_lsp_from_path(executable, lsp_name, config)
        if vim.fn.executable(executable) == 1 then
          vim.lsp.config(lsp_name, config or {})
          vim.lsp.enable(lsp_name)
        end
      end

      setup_lsp_from_path("standardrb", "standardrb", {
        cmd = { "standardrb", "--lsp" },
      })

      setup_lsp_from_path("ruby-lsp", "ruby_lsp", {
        cmd = { "ruby-lsp" },
        init_options = {
          -- Disable diagnostics and formatting since we use standalone standardrb
          -- Ruby LSP addons (standard, rubocop) may still load but won't provide these features
          enabledFeatures = {
            diagnostics = false,
            formatting = false,
          },
        },
      })

			vim.keymap.set("n", "gl", vim.diagnostic.open_float)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)
				end,
			})
    end
  }
}
