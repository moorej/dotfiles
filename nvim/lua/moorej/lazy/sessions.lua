return {
	"rmagatti/auto-session",

	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,
			cwd_change_handling = {
				post_cwd_changed_hook = function()
					require("lualine").refresh()
				end,
			},
		})
		vim.keymap.set(
			"n",
			"<leader>ss",
			require("auto-session.session-lens").search_session,
			{ desc = "Show sessions" }
		)
	end,
}
