return {
	"williamboman/mason-lspconfig.nvim",

	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	},

	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.preset("recommended")

		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })

			-- Return a new table with keys Y upserted into X
			-- This is non-destructive
			local rightMerge = function(x, y)
				local z = y
				for k, v in pairs(x) do
					z[k] = v
				end
				return z
			end
			local opts = { buffer = bufnr, remap = false }

			-- ThePrimeagen Keymaps YMMV
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, rightMerge(opts, { desc = "Jump to the definition" }))

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, rightMerge(opts, { desc = "Displays information about symbol" }))

			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, rightMerge(opts, { desc = "List symbols in the current workspace" }))

			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, rightMerge(opts, { desc = "Show diagnostics in a floating window." }))

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_prev()
			end, rightMerge(opts, { desc = "Move to the previous diagnostic" }))

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_next()
			end, rightMerge(opts, { desc = "Move to the next diagnostic" }))

			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, rightMerge(opts, { desc = "Show code actions" }))

			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, rightMerge(opts, { desc = "List references in quickfix" }))

			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, rightMerge(opts, { desc = "Rename symbol" }))

			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, rightMerge(opts, { desc = "Displays signature information" }))
		end)
		lsp_zero.setup()

		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"ansiblels", -- Ansible
				"spectral", -- JSON/YAML
				"lua_ls", -- Lua
				"pyright", -- Python
			},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				powershell_es = function()
					require("lspconfig").powershell_es.setup({
						filetypes = { "ps1", "psm1", "psd1" },
						shell = "pwsh",
						bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services",
						-- cmd = {
						-- 	"pwsh",
						-- 	"-NoLogo",
						-- 	"-NoProfile",
						-- 	"-Command",
						-- 	"~/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1",
						-- },
						-- settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
						-- init_options = {
						-- 	enableProfileLoading = false,
						-- },
					})
				end,
			},
		})
	end,
}
