local isActive = true
local p = require("persistence")

return {
  "folke/persistence.nvim",
  keys = {
    {
      "<leader>qs",
      function()
        p.save()
        vim.notify("Session saved", vim.log.levels.INFO, { title = "Persistence" })
      end,
      desc = "Save Session",
    },
    -- stylua: ignore start
    { "<leader>qr", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qt",
      function()
        if isActive then
          p.stop()
          isActive = false
          vim.notify("Stopped session recording", vim.log.levels.INFO, { title = "Persistence" })
        else
          p.start()
          isActive = true
          vim.notify("Started session recording", vim.log.levels.INFO, { title = "Persistence" })
        end
      end,
      desc = "Toggle Current Session Recording"
    },
    -- stylua: ignore end
  },
}
