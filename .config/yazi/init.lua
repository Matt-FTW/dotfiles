-- Plugins
require("starship"):setup()
require("zoxide"):setup({
	update_db = true,
})
require("session"):setup({
	sync_yanked = true,
})
