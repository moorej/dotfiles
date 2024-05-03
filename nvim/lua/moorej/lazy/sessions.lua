return {
	"rmagatti/session-lens",

	dependencies = {
		"rmagatti/auto-session",
		"nvim-telescope/telescope.nvim",
	},

	keys = {
		{
			"<leader>ss",
			function()
				require("session-lens").search_session()
			end,
			desc = "Show sessions",
		},
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

		require("session-lens").setup({})
	end,
}
