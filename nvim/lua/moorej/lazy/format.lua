return {
	"stevearc/conform.nvim",

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				html = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				python = { "black", "isort" },
				yaml = { "prettierd" },
			},

			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		})
	end,
}
