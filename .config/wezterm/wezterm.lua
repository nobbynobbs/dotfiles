-- Pull in the wezterm API
local wezterm = require("wezterm")
local os = require("os")

-- This table will hold the configuration.
local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14
config.default_prog = { "tmux" }
config.audible_bell = "Disabled"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.88
config.macos_window_background_blur = 20

config.set_environment_variables = {
	PATH = "/usr/local/bin:" .. os.getenv("PATH"),
}

return config
