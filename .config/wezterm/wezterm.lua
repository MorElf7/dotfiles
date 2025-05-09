local wezterm = require("wezterm")
local config = wezterm.config_builder()
local sessionizer = require("sessionizer")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local act = wezterm.action

-- Colors
config.color_scheme = "kanagawabones"
-- config.color_scheme = "Catppuccin Mocha"

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
-- config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

local SOLID_LEFT_DIV = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_DIV = wezterm.nerdfonts.ple_right_half_circle_thick

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#1e1e2e"
	local background = "#4c4f69"
	local foreground = "#eff1f5"
	local index_bg = "#4c4f69"
	local index_fg = "#eff1f5"

	if tab.is_active then
		index_bg = "#f5e0dc"
		index_fg = "#313244"
	elseif hover then
		index_bg = "#f5e0dc"
		index_fg = "#313244"
	end

	local edge_foreground = background
	local pane = tab.active_pane
	local title = basename(pane.foreground_process_name)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = index_bg } },
		{ Text = " " .. SOLID_LEFT_DIV },
		{ Background = { Color = index_bg } },
		{ Foreground = { Color = index_fg } },
		{ Text = "" .. tab.tab_index + 1 .. " " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_DIV },
	}
end)

config.colors = {
	-- foreground = "#C5C9C7",
	-- background = "#14171d",
	--
	-- -- cursor_bg = "#14171d",
	-- -- cursor_fg = "#C5C9C7",
	-- -- cursor_border = "#C5C9C7",
	--
	-- selection_fg = "#C5C9C7",
	-- selection_bg = "#393B42",
	--
	-- scrollbar_thumb = "#393B42",
	-- split = "#393B42",
	--
	-- ansi = {
	-- 	"#14171d",
	-- 	"#C4746E",
	-- 	"#8A9A7B",
	-- 	"#C4B28A",
	-- 	"#8BA4B0",
	-- 	"#A292A3",
	-- 	"#8EA4A2",
	-- 	"#A4A7A4",
	-- },
	-- brights = {
	-- 	"#A4A7A4",
	-- 	"#E46876",
	-- 	"#87A987",
	-- 	"#E6C384",
	-- 	"#7FB4CA",
	-- 	"#938AA9",
	-- 	"#7AA89F",
	-- 	"#C5C9C7",
	-- },
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
	{ family = "SF Pro", weight = "Regular" },
})
config.font_size = 11
config.front_end = "OpenGL"
config.freetype_load_target = "Normal"
config.freetype_load_flags = "NO_HINTING"

-- Multiplexing
config.unix_domains = {
	{
		name = "unix",
	},
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
config.default_gui_startup_args = { "connect", "unix" }

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
-- config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL" }

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	{ key = "a", mods = "LEADER|CTRL", action = act({ SendString = "\x01" }) },
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
	-- { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	-- { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	-- { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	-- { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	-- Switch to the default workspace
	{
		key = "g",
		mods = "CTRL",
		action = act.SwitchToWorkspace({
			name = "personal",
		}),
	},
	-- Sessionizer
	{ key = "f", mods = "CTRL", action = wezterm.action_callback(sessionizer.toggle) },
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
	-- {
	-- 	key = "Enter",
	-- 	mods = "SUPER",
	-- 	action = wezterm.action.SpawnWindow,
	-- },
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
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
		end),
	},
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.state_manager.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.state_manager.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.state_manager.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
}
local function next_match(int)
	local m = act.CopyMode("NextMatch")
	if int == -1 then
		m = act.CopyMode("PriorMatch")
	end
	return act.Multiple({ m, act.CopyMode("ClearSelectionMode") })
end
local copy_mode = nil
local search_mode = nil
if wezterm.gui then
	copy_mode = wezterm.gui.default_key_tables().copy_mode
	table.insert(copy_mode, {
		key = "/",
		mods = "NONE",
		action = act.Multiple({
			act.CopyMode("ClearPattern"),
			act.Search({ CaseInSensitiveString = "" }),
		}),
	})
	table.insert(copy_mode, { key = "p", mods = "CTRL", action = next_match(-1) })
	table.insert(copy_mode, { key = "n", mods = "CTRL", action = next_match(1) })

	search_mode = wezterm.gui.default_key_tables().search_mode
	table.insert(search_mode, { key = "Escape", mods = "NONE", action = act.CopyMode("Close") })
	table.insert(search_mode, { key = "Enter", mods = "NONE", action = act.ActivateCopyMode })
end

config.key_tables = {
	copy_mode = copy_mode,
	search_mode = search_mode,
}

resurrect.state_manager.periodic_save({
	interval_seconds = 60 * 10,
	save_workspaces = true,
	save_windows = true,
	save_tabs = true,
})
wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)
wezterm.on("resurrect.error", function(err)
	wezterm.log_error("ERROR!")
	wezterm.gui.gui_windows()[1]:toast_notification("resurrect", err, nil, 3000)
end)

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "ALT",
	},
})

return config
