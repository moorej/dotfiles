local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- UI Config
config.color_scheme = "Chalk (base16)"
config.font_size = 13.0

config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font", weight = "Medium" },
})

-- App Config
config.quit_when_all_windows_are_closed = false

return config
