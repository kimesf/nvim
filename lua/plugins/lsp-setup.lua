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
        ensured_installed = {
          "ruby_lsp",
          "lua_ls",
          "dockerls",
          "docker_compose_language_service",
					"ts_ls",
          -- "sorbet",
        }
      })
    end
  },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

      lspconfig.ruby_lsp.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.ts_ls.setup({})
			-- lspconfig.sorbet.setup({})

      -- lspconfig.rubocop.setup({})

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
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = {
	-- 				"lua_ls",
	-- 				"dockerls",
	-- 				"docker_compose_language_service",
	-- 				-- "jsonls",
	-- 				-- "marksman",
	-- 				-- "cssls",
	-- 				"tailwindcss",
	-- 				"html",
	-- 				"ts_ls",
	-- 				-- "sqls",
	-- 				"rubocop",
	-- 				-- "rust_analyzer",
	-- 				-- "elixirls",
	-- 				"ruby_lsp",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		local lspconfig = require("lspconfig")
	--
	-- 		-- ruby lsp textDocument/diagnostic support until 0.10.0 is released
	--
	-- 		_timers = {}
	-- 		local function setup_diagnostics(client, buffer)
	-- 			if require("vim.lsp.diagnostic")._enable then
	-- 				return
	-- 			end
	-- 			local diagnostic_handler = function()
	-- 				local params = vim.lsp.util.make_text_document_params(buffer)
	-- 				client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
	-- 					if err then
	-- 						local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
	-- 						vim.lsp.log.error(err_msg)
	-- 					end
	-- 					local diagnostic_items = {}
	-- 					if result then
	-- 						diagnostic_items = result.items
	-- 					end
	-- 					vim.lsp.diagnostic.on_publish_diagnostics(
	-- 						nil,
	-- 						vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
	-- 						{ client_id = client.id }
	-- 					)
	-- 				end)
	-- 			end
	-- 			diagnostic_handler() -- to request diagnostics on buffer when first attaching
	-- 			vim.api.nvim_buf_attach(buffer, false, {
	-- 				on_lines = function()
	-- 					if _timers[buffer] then
	-- 						vim.fn.timer_stop(_timers[buffer])
	-- 					end
	-- 					_timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
	-- 				end,
	-- 				on_detach = function()
	-- 					if _timers[buffer] then
	-- 						vim.fn.timer_stop(_timers[buffer])
	-- 					end
	-- 				end,
	-- 			})
	-- 		end
	--
	-- 		lspconfig.ruby_lsp.setup({
	-- 			on_attach = function(client, buffer)
	-- 				setup_diagnostics(client, buffer)
	-- 			end,
	-- 		})
	--
	-- 		-- ruby lsp textDocument/diagnostic support until 0.10.0 is released
	--
	-- 		lspconfig.lua_ls.setup({})
	-- 		lspconfig.dockerls.setup({})
	-- 		lspconfig.docker_compose_language_service.setup({})
	-- 		-- lspconfig.jsonls.setup({})
	-- 		-- lspconfig.marksman.setup({})
	-- 		-- lspconfig.cssls.setup({})
	-- 		lspconfig.tailwindcss.setup({})
	-- 		lspconfig.html.setup({})
	-- 		lspconfig.ts_ls.setup({})
	-- 		-- lspconfig.sqls.setup({})
	-- 		-- lspconfig.rust_analyzer.setup({})
	-- 		-- lspconfig.elixirls.setup({})
	--
	-- 		vim.keymap.set("n", "gl", vim.diagnostic.open_float)
	--
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	-- 			callback = function(ev)
	-- 				local opts = { buffer = ev.buf }
	--
	-- 				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- 				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- 				vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	-- 		local code_actions = null_ls.builtins.code_actions
	-- 		local diagnostics = null_ls.builtins.diagnostics
	-- 		local formatting = null_ls.builtins.formatting
	-- 		local hover = null_ls.builtins.hover
	-- 		local completion = null_ls.builtins.completion
	--
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				formatting.stylua,
	--
	-- 				diagnostics.rubocop,
	-- 				formatting.rubocop,
	--
	-- 				formatting.eslint_d,
	-- 				diagnostics.eslint_d,
	-- 				code_actions.eslint_d,
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set({ "n", "v" }, "<leader>ff", vim.lsp.buf.format, {})
	-- 	end,
	-- },
}
