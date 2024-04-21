return {
	"nvim-telescope/telescope.nvim",

	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/trouble.nvim",
	},

	lazy = false,

	config = function()
		local telescope = require("telescope")
		local trouble = require("trouble.providers.telescope")
		telescope.load_extension("fzf")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<c-t>"] = trouble.open_with_trouble,
					},
					n = {
						["<c-t>"] = trouble.open_with_trouble,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
				file_ignore_patterns = {
					".git/*",
					"_build/*",
					".elixir_ls/*",
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show buffers" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find project files" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
		vim.keymap.set("n", "<leader>ps", function()
			vim.ui.input({ prompt = "Grep:" }, function(input)
				builtin.grep_string({ search = input })
			end)
		end, { desc = "Grep within project" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Search help tags" })
	end,
}
