local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- Shortcuts
config.keys = {
	{ key = "H", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
	{ key = "p", mods = "CMD", action = action.PaneSelect },
}

-- UI Config
config.color_scheme = "Chalk (base16)"
config.font_size = 13.0

config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font", weight = "Medium" },
})

-- App Config
config.show_update_window = true

config.quit_when_all_windows_are_closed = false

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

return config
