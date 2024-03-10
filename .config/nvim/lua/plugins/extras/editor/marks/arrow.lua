return {
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      show_icons = true,
    },
    keys = {
      {
        "<leader><cr>",
        function()
          require("arrow.ui").openMenu()
        end,
        desc = "Marks",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, require("arrow.statusline").text_for_statusline_with_icons())
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      -- stylua: ignore
      local button = dashboard.button("m", "󰛢 " .. " Marks", function() require("arrow.ui").openMenu() end)
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
        action = function() require("arrow.ui").openMenu() end,
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
