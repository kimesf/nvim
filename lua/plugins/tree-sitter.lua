return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "typescript", "ruby", "rust" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})

    -- fix ruby dedent after pressing '.'
    vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]
	end,
}
