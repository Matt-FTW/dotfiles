return {
  {
    "dzfrias/arena.nvim",
    event = "BufWinEnter",
    opts = {
      per_project = true,
      devicons = true,
    },
    -- stylua: ignore
    keys = {
      { "<leader>m", function() require("arena").toggle() end, desc = "Marks" },
    },
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      -- stylua: ignore
      local button = dashboard.button("m", "󰛢 " .. " Marks", function() require("arena").toggle() end)
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      -- stylua: ignore
      local arrow = {
        action = function() require("arena").toggle() end,
        desc = " Marks",
        icon = "󰛢 ",
        key = "m",
      }

      arrow.desc = arrow.desc .. string.rep(" ", 43 - #arrow.desc)
      arrow.key_format = "  %s"

      table.insert(opts.config.center, 5, arrow)
    end,
  },
}
