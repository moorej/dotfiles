local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- UI Config
config.font = wezterm.font("FiraCode Nerd Font")
config.color_scheme = "Chalk (base16)"
config.font_size = 13.0

-- App Config
config.quit_when_all_windows_are_closed = false

return config
