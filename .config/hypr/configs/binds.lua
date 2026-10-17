local vars = require("configs.variables")

local function bind(modifier, key, cmd)
	hl.bind(modifier .. " + " .. key, hl.dsp.exec_cmd(cmd))
end

local mods = vars.binds

-- Applications
bind(mods.mainMod, "W", vars.browser)
bind(mods.mainMod, "RETURN", vars.terminal)
bind(mods.mainMod, "E", vars.file_manager)

-- Notifications
bind(mods.mainMod, "N", vars.notifications.toggle)
bind(mods.mainMod, "SHIFT + R", vars.notifications.reload)
bind(mods.mainMod, "SHIFT + N", vars.notifications.read)
bind(mods.mainMod, "CTRL + N", vars.notifications.disturb)

-- Bar
bind(mods.mainMod, "CTRL + R", vars.bar.reload)
bind(mods.mainMod, "T", vars.bar.toggle)

-- Launchers
hl.bind(mods.mainMod .. " + TAB", hl.dsp.submap("menu"))

hl.define_submap("menu", function()
	hl.bind("TAB", hl.dsp.exec_cmd(vars.launcher.toggle), { repeating = true })
	hl.bind("TAB", hl.dsp.submap("reset"), { locked = true })

	hl.bind("I", hl.dsp.exec_cmd(vars.launcher.icons), { repeating = true })
	hl.bind("I", hl.dsp.submap("reset"), { locked = true })

	hl.bind("W", hl.dsp.exec_cmd(vars.launcher.weather), { repeating = true })
	hl.bind("W", hl.dsp.submap("reset"), { locked = true })

	hl.bind("SHIFT + W", hl.dsp.exec_cmd(vars.launcher.wifi), { repeating = true })
	hl.bind("SHIFT + W", hl.dsp.submap("reset"), { locked = true })

	hl.bind("CTRL + W", hl.dsp.exec_cmd(vars.launcher.wallpapers), { repeating = true })
	hl.bind("CTRL + W", hl.dsp.submap("reset"), { locked = true })

	hl.bind("Y", hl.dsp.exec_cmd(vars.launcher.history), { repeating = true })
	hl.bind("Y", hl.dsp.submap("reset"), { locked = true })

	hl.bind("E", hl.dsp.exec_cmd(vars.launcher.emojis), { repeating = true })
	hl.bind("E", hl.dsp.submap("reset"), { locked = true })

	hl.bind("G", hl.dsp.exec_cmd(vars.launcher.gifs), { repeating = true })
	hl.bind("G", hl.dsp.submap("reset"), { locked = true })

	hl.bind("P", hl.dsp.exec_cmd(vars.launcher.pass), { repeating = true })
	hl.bind("P", hl.dsp.submap("reset"), { locked = true })

	hl.bind("SHIFT + P", hl.dsp.exec_cmd(vars.launcher.players), { repeating = true })
	hl.bind("SHIFT + P", hl.dsp.submap("reset"), { locked = true })

	hl.bind("T", hl.dsp.exec_cmd(vars.launcher.time), { repeating = true })
	hl.bind("T", hl.dsp.submap("reset"), { locked = true })

	hl.bind("SHIFT + T", hl.dsp.exec_cmd(vars.launcher.translate), { repeating = true })
	hl.bind("SHIFT + T", hl.dsp.submap("reset"), { locked = true })

	hl.bind("B", hl.dsp.exec_cmd(vars.launcher.bookmarks), { repeating = true })
	hl.bind("B", hl.dsp.submap("reset"), { locked = true })

	hl.bind("SHIFT + B", hl.dsp.exec_cmd(vars.launcher.bluetooth), { repeating = true })
	hl.bind("SHIFT + B", hl.dsp.submap("reset"), { locked = true })

	hl.bind("R", hl.dsp.exec_cmd(vars.launcher.random), { repeating = true })
	hl.bind("R", hl.dsp.submap("reset"), { locked = true })

	hl.bind("SHIFT + S", hl.dsp.exec_cmd(vars.launcher.shortcuts), { repeating = true })
	hl.bind("SHIFT + S", hl.dsp.submap("reset"), { locked = true })

	hl.bind("S", hl.dsp.exec_cmd(vars.launcher.screenshots), { repeating = true })
	hl.bind("S", hl.dsp.submap("reset"), { locked = true })

	hl.bind("C", hl.dsp.exec_cmd(vars.launcher.color_picker), { repeating = true })
	hl.bind("C", hl.dsp.submap("reset"), { locked = true })

	hl.bind("ESCAPE", hl.dsp.submap("reset"), { repeating = true })
	hl.bind("RETURN", hl.dsp.submap("reset"), { repeating = true })
end)

-- Scratchpads
bind(mods.mainMod, "V", vars.terminal .. " --class=com.center-float -e wiremix")
bind(mods.mainMod, "B", vars.terminal .. " --class=com.center-float -e bluetui")
bind(mods.mainMod, "I", vars.terminal .. " --class=com.center-float -e iwgtk")

-- Windows
-- Basic Operations
hl.bind(mods.mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mods.mainMod .. " + A", hl.dsp.window.float())
hl.bind(mods.mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind("ALT + TAB", hl.dsp.focus({ last = true }))

-- Mouse
hl.bind(mods.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mods.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Focusing
hl.bind(mods.mainMod .. " + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind(mods.mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mods.mainMod .. " + UP", hl.dsp.focus({ direction = "u" }))
hl.bind(mods.mainMod .. " + DOWN", hl.dsp.focus({ direction = "d" }))
-- Vim-keybinds
hl.bind(mods.mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mods.mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mods.mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mods.mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mods.mainMod .. " + mouse_down", hl.dsp.focus({ direction = "r" }))
hl.bind(mods.mainMod .. " + mouse_up", hl.dsp.focus({ direction = "l" }))

-- Moving
hl.bind(mods.modShift .. " + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind(mods.modShift .. " + RIGHT", hl.dsp.window.move({ direction = "r" }))
hl.bind(mods.modShift .. " + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind(mods.modShift .. " + DOWN", hl.dsp.window.move({ direction = "d" }))
bind(mods.modShift, "code:51", "~/.config/hypr/scripts/move_by_rules") -- Backslash
-- Vim-keybinds
hl.bind(mods.modShift .. " + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mods.modShift .. " + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mods.modShift .. " + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mods.modShift .. " + J", hl.dsp.window.move({ direction = "d" }))

-- Center and Split
hl.bind(mods.mainMod .. " + S", hl.dsp.layout("swapsplit"))
bind(mods.mainMod, "C", "hyprctl dispatch centerwindow 1")

-- Group Control
-- hl.bind(mods.mainMod .. " + G", hl.dsp.group.toggle())
-- hl.bind(mods.modCtrl .. " + G", hl.dsp.group.lock_active({ action = "toggle" }))
-- hl.bind("CTRL + ALT + TAB", hl.dsp.group.next())

-- Resizing Windows
hl.bind(mods.mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("RIGHT", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("LEFT", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("UP", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("DOWN", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

	hl.bind("L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

	hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)

-- Workspaces
-- Focusing other Workspaces
-- Moving Windows to other Workspaces
-- Moving Windows to other Workspaces (Silent)
for i = 1, 9 do
	hl.bind(mods.mainMod .. " + " .. i, hl.dsp.focus({ workspace = "r~" .. i }))
	hl.bind(mods.modShift .. " + " .. i, hl.dsp.window.move({ workspace = "r~" .. i }))
	hl.bind(mods.modAlt .. " + " .. i, hl.dsp.window.move({ workspace = "r~" .. i, follow = false }))
end

-- Moving to other Workspace with Mouse Control
hl.bind(mods.modCtrl .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mods.modCtrl .. " + mouse_up", hl.dsp.focus({ workspace = "m+1" }))

-- Moving to other Workspace with Keyboard
hl.bind(mods.modCtrl .. " + UP", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mods.modCtrl .. " + DOWN", hl.dsp.focus({ workspace = "m+1" }))

hl.bind(mods.modCtrl .. " + K", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mods.modCtrl .. " + J", hl.dsp.focus({ workspace = "m+1" }))

-- Media
-- Audio
hl.bind(
	mods.modCtrl .. " + mouse:280",
	hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
	{ locked = true }
) -- Extra Up Button
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind(mods.modCtrl .. " + mouse:281", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true }) -- Extra Down Button
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("exec swayosd-client --input-volume mute-toggle"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mods.modCtrl .. " + mouse:282", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- Extra Center Button
hl.bind(mods.modCtrl .. " + RETURN", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mods.modCtrl .. " + mouse:275", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- Extra Back Button
hl.bind(mods.modCtrl .. " + code:20", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- Minus Key
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mods.modCtrl .. " + mouse:276", hl.dsp.exec_cmd("playerctl next"), { locked = true }) -- Extra Forward Button
hl.bind(mods.modCtrl .. " + code:21", hl.dsp.exec_cmd("playerctl next"), { locked = true }) -- Plus Key

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume +10"),
	{ locked = true, repeating = true }
)
hl.bind(
	mods.mainMod .. " + code:21",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
) -- Minus key
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume -10"),
	{ locked = true, repeating = true }
)
hl.bind(
	mods.mainMod .. " + code:20",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
) -- Plus key

-- hl.bind("XF86InputRaiseVolume", hl.dsp.exec_cmd("swayosd-client --input-volume raise"), { locked = true, repeating = true })
hl.bind(
	mods.modShift .. " + code:21",
	hl.dsp.exec_cmd("swayosd-client --input-volume raise"),
	{ locked = true, repeating = true }
) -- Minus key
-- hl.bind("XF86InputLowerVolume", hl.dsp.exec_cmd("swayosd-client --input-volume lower"), { locked = true, repeating = true })
hl.bind(
	mods.modShift .. " + code:20",
	hl.dsp.exec_cmd("swayosd-client --input-volume lower"),
	{ locked = true, repeating = true }
) -- Plus key

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness +10"), { locked = true, repeating = true })
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness -10"),
	{ locked = true, repeating = true }
)

-- Other
-- Exit
hl.bind(mods.modCtrl .. " + M", hl.dsp.exit())

-- Disable anim, blur, etc
bind(mods.mainMod, "F12", "~/.config/hypr/scripts/performance")

-- Freeze active window
bind(mods.modShift, "ESCAPE", "~/.config/hypr/scripts/hyprfreeze -a")

-- Open Wikis
bind(mods.mainMod, "F1", "xdg-open https://wiki.hyprland.org/")

-- Zoom
hl.bind(
	mods.modShift .. " + mouse:276",
	hl.dsp.exec_cmd(
		"hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 + 0.5}')"
	)
)
hl.bind(
	mods.modShift .. " + mouse:275",
	hl.dsp.exec_cmd(
		"hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 - 0.5}')"
	)
)

-- VM Keys
-- hl.bind(mods.minMod .. " + code:118", hl.dsp.submap("passthru")) -- Supr
-- hl.define_submap("passthru", function()
-- 	hl.bind(mods.modShift .. " + code:119", hl.dsp.submap("reset")) -- Supr
-- end)

-- Screenshots
bind(
	"CTRL",
	"DELETE",
	"flameshot screen --number 0 --path '/home/matt/dev/class/curso-especializacion-nube/Fundamentos de computacion en la nube/Tema 3 - Redes y entrega de contenido en la nube/media/skillbuilder/'"
)
bind("CTRL + SHIFT", "DELETE", "flameshot screen --number 0 --edit")

hl.bind(mods.mainMod .. " + period", hl.dsp.layout("colresize +conf"))
hl.bind(mods.mainMod .. " + comma", hl.dsp.layout("colresize -conf"))
hl.bind(mods.mainMod .. " + SHIFT + period", hl.dsp.layout("swapcol r"))
hl.bind(mods.mainMod .. " + SHIFT + comma", hl.dsp.layout("swapcol l"))
