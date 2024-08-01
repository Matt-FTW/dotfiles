-- Plugins
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})
require("zoxide"):setup({
	update_db = true,
})
require("session"):setup({
	sync_yanked = true,
})
require("starship"):setup()
require("yaziline"):setup({
	separator_style = "liney", -- "angly" | "curvy" | "liney" | "empty"
	separator_open = "",
	separator_close = "",
	separator_open_thin = "",
	separator_close_thin = "",
	select_symbol = "",
	yank_symbol = "󰆐",
	filename_max_length = 24, -- trim when filename > 24
	filename_trim_length = 6, -- trim 6 chars from both ends
})
