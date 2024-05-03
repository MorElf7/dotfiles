local wezterm = require("wezterm")
local act = wezterm.action

local function is_inside_vim(pane)
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, stdout, stderr = wezterm.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t"
			.. wezterm.shell_quote_arg(tty)
			.. " | "
			.. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
	})

	return success
end

local function is_outside_vim(pane)
	return not is_inside_vim(pane)
end

local M = {}

M.bind_if = function(key, mods, action)
	local function callback(win, pane)
		if is_outside_vim(pane) then
			if pane:is_alt_screen_active() then
				win:perform_action(wezterm.action.SendKey({ key = key, mods = mods }), pane)
			else
				win:perform_action(action, pane)
			end
		else
			win:perform_action(act.SendKey({ key = key, mods = mods }), pane)
		end
	end

	return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

return M
