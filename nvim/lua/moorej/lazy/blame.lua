return {
	"braxtons12/blame_line.nvim",

	config = function()
		require("blame_line").setup({
			prefix = "   ",
		})
	end,
}
