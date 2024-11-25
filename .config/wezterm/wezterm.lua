local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors
-- config.color_scheme = "kanagawabones"
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font_with_fallback({
	-- {
	-- 	family = "BlexMono Nerd Font Mono",
	-- 	weight = "Regular",
	-- },
	-- {
	-- 	family = "CommitMono Nerd Font Mono",
	-- 	weight = "Regular",
	-- 	harfbuzz_features = { "calt", "liga", "ss02", "ss03", "ss04", "ss05", "cv02", "cv05" },
	-- },
	{
		family = "MonaspiceNe Nerd Font Mono",
		weight = "Regular",
		harfbuzz_features = { "calt", "liga", "ss03", "ss07", "ss09" },
	},
	-- {
	-- 	family = "JetBrainsMono Nerd Font",
	-- 	weight = "Regular",
	-- 	harfbuzz_features = { "zero", "cv14", "cv01", "cv02", "ss05", "ss04", "cv18", "ss03", "cv15" },
	-- },
	{
		family = "FiraCode Nerd Font Mono",
		weight = "Regular",
		harfbuzz_features = { "calt", "zero", "cv14", "cv01", "cv02", "ss05", "ss04", "cv18", "ss03", "cv15" },
	},
	{ family = "SF Pro", weight = "Regular" },
})
config.font_size = 13
config.front_end = "WebGpu"
config.freetype_load_target = "Normal"
config.freetype_load_flags = "NO_HINTING"

-- Scrollback
config.scrollback_lines = 50000
config.enable_scroll_bar = false

-- Window Appearance
config.window_padding = {
	left = 0,
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
config.term = "wezterm"
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
		mods = "SUPER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "w",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{ key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
}

return config
