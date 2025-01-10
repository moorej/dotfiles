local wezterm = require("wezterm")

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
-- local function is_vim(pane)
--   -- This gsub is equivalent to POSIX basename(3)
--   -- Given "/foo/bar" returns "bar"
--   -- Given "c:\\foo\\bar" returns "bar"
--   local process_name = string.gsub(pane:get_foreground_process_name(), '(.*[/\\])(.*)', '%2')
--   return process_name == 'nvim' or process_name == 'vim'
-- end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

local config = {
	-- Shortcuts
	disable_default_key_bindings = true,
	leader = { key = "a", mods = "CTRL" },
	keys = {
		-- move between split panes
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),

		-- Split hositontally
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		-- Split vertically
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		-- Open new window
		{ key = "n", mods = "CMD", action = wezterm.action.SpawnWindow },
		-- Close current tab
		{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
		-- Close current pane
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		-- Zoom current pane
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		-- Create new tab
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
		-- Swap panes
		{ key = "0", mods = "CTRL", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },

		-- Activate tab number 'x'
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },

		-- { key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },

		-- Use system Clipboard
		{ key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },

		-- Increase/Decrease font size
		{ key = "+", mods = "SHIFT|CTRL", action = "IncreaseFontSize" },
		{ key = "-", mods = "SHIFT|CTRL", action = "DecreaseFontSize" },
		{ key = "0", mods = "SHIFT|CTRL", action = "ResetFontSize" },

		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },

		-- Copy mode
		{ key = "[", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
	},

	-- UI Config
	color_scheme = "Chalk (base16)",
	font_size = 13.0,

	font = wezterm.font_with_fallback({
		{ family = "FiraCode Nerd Font", weight = "Medium" },
	}),

	-- App Config
	show_update_window = true,
	quit_when_all_windows_are_closed = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	launch_menu = {},
}

return config
