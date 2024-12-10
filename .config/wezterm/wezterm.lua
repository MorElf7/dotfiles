local wezterm = require("wezterm")
local config = wezterm.config_builder()
local sessionizer = require("sessionizer")
local act = wezterm.action

-- Colors
-- config.color_scheme = "kanagawabones"
config.color_scheme = "Catppuccin Mocha"

-- Window Appearance
config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 0,
}
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
config.window_decorations = "NONE"

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#1e1e2e",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#cba6f7",
			-- The color of the text for the tab
			fg_color = "#313244",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#1e1e2e",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#1e1e2e",
			fg_color = "#1e1e2e",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

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
		harfbuzz_features = { "calt", "liga", "ss02", "ss03", "ss07", "ss09" },
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
	-- { family = "SF Pro", weight = "Regular" },
})
config.font_size = 10
config.front_end = "OpenGL"
config.freetype_load_target = "Normal"
config.freetype_load_flags = "NO_HINTING"

-- Scrollback
config.scrollback_lines = 50000
config.enable_scroll_bar = false

-- Misc
config.audible_bell = "Disabled"
config.enable_wayland = true
-- config.term = "xterm-kitty"
config.automatically_reload_config = true
config.debug_key_events = true
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true
config.max_fps = 120
config.default_workspace = "personal"

-- Keybinds
config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL" }

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	-- { key = "a", mods = "LEADER|CTRL", action = act({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	-- { key = "h", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	-- { key = "j", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	-- { key = "k", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	-- { key = "l", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },
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
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	-- Switch to the default workspace
	{
		key = "p",
		mods = "LEADER",
		action = act.SwitchToWorkspace({
			name = "personal",
		}),
	},
	-- Sessionizer
	{ key = "o", mods = "LEADER", action = wezterm.action_callback(sessionizer.toggle) },
	-- Misc
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
