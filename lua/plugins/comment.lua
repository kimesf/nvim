return {
	"numToStr/Comment.nvim",
	lazy = false,
	opts = {
		mappings = {
			basic = true,
			extra = false,
		},
	},
	config = function()
		require("Comment").setup()
	end,
}
