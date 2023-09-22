return {
    {
        "barrett-ruth/live-server.nvim",
        build = "yarn global add live-server",
        cmd = { "LiveServerStop", "LiveServerStart" },
        config = true,
    },
}
