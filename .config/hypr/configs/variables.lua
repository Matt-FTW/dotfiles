local bar = "waybar"
local notifications = "swaync-client"
local launcher = "vicinae"

local launcher_commands = {
	toggle = "toggle",
	windows = "vicinae://extensions/vicinae/wm/switch-windows",
	history = "vicinae://launch/clipboard/history",
	emojis = "vicinae://launch/core/search-emojis",
	icons = "vicinae://launch/@nino-mau/store.vicinae.iconify/search-icons",
	gifs = "vicinae://launch/@josephschmitt/store.raycast.gif-search/search",
	players = "vicinae://launch/@dagimg-dot/store.vicinae.player-pilot/player-pilot",
	wallpapers = "vicinae://launch/@sovereign/store.vicinae.awww-switcher/wpgrid",
	weather = "vicinae://launch/@tonka3000/store.raycast.weather/index",
	time = "vicinae://launch/@joao.mainka/store.raycast.raycast-timezone-converter/index",
	pass = "vicinae://launch/@jomifepe/store.raycast.bitwarden/search",
	pass_lock = "vicinae://launch/@jomifepe/store.raycast.bitwarden/lock-vault",
	shortcuts = "vicinae://launch/manage-shortcuts/manage",
	translate = "vicinae://launch/@gebeto/store.raycast.translate/translate",
	bluetooth = "vicinae://launch/@Gelei/store.vicinae.bluetooth/devices",
	random = "vicinae://launch/@loris/store.raycast.random/index",
	wifi = "vicinae://launch/@dagimg-dot/store.vicinae.wifi-commander/scan-wifi",
	bookmarks = "vicinae://launch/@luolei/store.raycast.karakeep/bookmarks",
	screenshots = "vicinae://launch/@piesinu/hyprshot-vicinae/make-screenshot",
	color_picker = "vicinae://launch/@psampir/color-picker/pick-color",
}

local function create_launcher_commands(commands)
	local lcon = {}
	for key, value in pairs(commands) do
		lcon[key] = launcher .. " " .. value
	end

	return lcon
end

local variables = {
	bar = {
		launch = bar,
		toggle = "noctalia msg bar-toggle",
		reload = "killall " .. bar,
	},
	notifications = {
		launch = notifications,
		toggle = "noctalia msg panel-toggle control-center 'notifications'",
		disturb = "noctalia msg notification-dnd-toggle",
		read = "noctalia msg notification-clear-history",
		reload = notifications .. " -R && " .. notifications .. " -rs",
	},
	launcher = create_launcher_commands(launcher_commands),
	terminal = "ghostty --gtk-single-instance=true",
	browser = "zen-browser",
	office = "libreoffice",
	file_manager = "nemo",
	binds = {
		mainMod = "SUPER",
		modShift = "SUPER + SHIFT",
		modAlt = "SUPER + ALT",
		modCtrl = "SUPER + CTRL",
	},
}

return variables
