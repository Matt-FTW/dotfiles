return {
  "folke/persistence.nvim",
  optional = true,
  keys = {
    {
      "<leader>qS",
      function()
        local p = require("persistence")
        p.save()
        LazyVim.notify("Session Saved", { title = "Persistence" })
      end,
      desc = "Save Session",
    },
    -- stylua: ignore start
    {
      "<leader>qt",
      function()
        local isActive = true
        local p = require("persistence")
        if isActive then
          p.stop()
          isActive = false
          vim.notify("Stopped Session Recording", vim.log.levels.INFO, { title = "Persistence" })
        else
          p.start()
          isActive = true
          vim.notify("Started Session Recording", vim.log.levels.INFO, { title = "Persistence" })
        end
      end,
      desc = "Toggle Current Session Recording"
    },
    -- stylua: ignore end
  },
}
