local isActive = true
local p = require("persistence")

return {
  "folke/persistence.nvim",
  keys = {
    {
      "<leader>qS",
      function()
        p.save()
        LazyVim.notify("Session Saved", { title = "Persistence" })
      end,
      desc = "Save Session",
    },
    -- stylua: ignore start
    { "<leader>qt",
      function()
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
