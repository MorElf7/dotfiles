local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors
-- config.color_scheme = "kanagawabones"
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "FiraCode Nerd Font Mono",
		weight = "Medium",
		stretch = "Normal",
		harfbuzz_features = { "calt=0", "zero", "cv14", "cv01", "cv02", "ss05", "ss04", "cv18", "ss03", "cv15" },
	},
	{ family = "JetBrainsMono Nerd Font", weight = "Medium" },
	{ family = "SF Pro", weight = "Medium" },
})
config.font_size = 13
config.front_end = "WebGpu"
config.freetype_load_target = "Normal"
-- config.line_height = 1.15
-- config.cell_width = 1.00
-- config.freetype_load_flags = "NO_HINTING"

-- Scrollback
config.scrollback_lines = 50000
config.enable_scroll_bar = false

-- Window Appearance
config.window_padding = {
	left = 5,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_tab_bar = false
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"

-- Misc
config.automatically_reload_config = true
config.debug_key_events = true
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true
config.max_fps = 120
config.native_macos_fullscreen_mode = true

-- Keybinds
config.disable_default_key_bindings = true
config.keys = {
	{
		key = "v",
		mods = "SHIFT|CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "c",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "m",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "=",
		mods = "SHIFT|CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "SHIFT|CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "Enter",
		mods = "SUPER",
		action = wezterm.action.SpawnWindow,
	},
	{
		key = "w",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{ key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
}

return config
