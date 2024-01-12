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
					"jsonls",
					"marksman",
					"cssls",
					"tailwindcss",
					"html",
					"tsserver",
					"sqls",
					"rubocop",
					"rust_analyzer",
					"elixirls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.cssls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.html.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.sqls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.elixirls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
