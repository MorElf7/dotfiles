local wezterm = require("wezterm")
local config = wezterm.config_builder()
local sessionizer = require("sessionizer")
local navigator = require("vim-navigator")
local bind_if = navigator.bind_if

local act = wezterm.action

-- Colors
-- config.color_scheme = "kanagawabones"
config.colors = {
	foreground = "#dcd7ba",
	background = "#1f1f28",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}
config.force_reverse_video_cursor = true

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 13

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
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
}
config.window_background_opacity = 0.8
config.text_background_opacity = 0.6
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"

-- Misc
config.automatically_reload_config = true
config.debug_key_events = true
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true

-- Keybinds
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{ key = "a", mods = "LEADER|CTRL", action = act({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "j", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "k", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "l", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },
	{ key = "d", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	-- Vim-navigator
	bind_if("h", "CTRL", act.ActivatePaneDirection("Left")),
	bind_if("j", "CTRL", act.ActivatePaneDirection("Down")),
	bind_if("k", "CTRL", act.ActivatePaneDirection("Up")),
	bind_if("l", "CTRL", act.ActivatePaneDirection("Right")),
	-- Switch to the default workspace
	bind_if(
		"p",
		"CTRL",
		act.SwitchToWorkspace({
			name = "default",
		})
	),
	-- Sessionizer
	{ key = "o", mods = "CTRL", action = wezterm.action_callback(sessionizer.toggle) },
	-- Fuzzy workspace
	{
		key = "f",
		mods = "CTRL",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

return config
