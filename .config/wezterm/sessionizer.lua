local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/usr/bin/fd"

function getLastDirectory(path)
	-- Remove trailing slash if present
	if path:sub(-1) == "/" then
		path = path:sub(1, -2)
	end

	-- Find the last slash in the path
	local lastSlash = path:match(".*/()")

	-- Extract the last directory name
	if lastSlash then
		return path:sub(lastSlash)
	else
		return path
	end
end

M.toggle = function(window, pane)
	local projects = {}

	local success, stdout, stderr = wezterm.run_child_process({
		fd,
		"-td",
		"--max-depth=1",
		"--prune",
		".",
		"/home/morelf/Documents/course",
		"/home/morelf/Documents/projects",
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local label = line
		local id = getLastDirectory(line)
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. id)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
