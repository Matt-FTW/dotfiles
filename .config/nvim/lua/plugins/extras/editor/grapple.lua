local keys = {}

-- stylua: ignore start
for i = 1, 9 do
  table.insert(keys, { "<leader><cr>" .. i, "<cmd>Grapple select index=" .. i .. "<CR>", desc = "File " .. i })
end

table.insert(keys, { "<leader><cr>a", "<cmd>Grapple tag<CR>", desc = "Add Mark" })
table.insert(keys, { "<leader><cr><cr>", "<cmd>Grapple toggle_tags<CR>", desc = "Marks" })
table.insert(keys, { "<leader><cr>t", "<cmd>Telescope grapple tags<CR>", desc = "Marks (Telescope)" })
table.insert(keys, { "<leader><cr>C", "<cmd>Grapple reset<CR>", desc = "Clear all Marks" })
table.insert(keys, { "<leader><cr>c", "<cmd>Grapple untag<CR>", desc = "Clear current Mark" })
table.insert(keys, { "<leader><cr>s", "<cmd>Grapple toggle_scopes<CR>", desc = "Scopes" })
table.insert(keys, { "<leader><cr>S", "<cmd>Grapple toggle_loaded<CR>", desc = "Loaded Scopes" })

table.insert(keys, { "]<cr>", "<cmd>Grapple cycle forward<CR>", desc = "Next Mark" })
table.insert(keys, { "[<cr>", "<cmd>Grapple cycle backward<CR>", desc = "Prev Mark" })

table.insert(keys, { "<C-A-l>", "<cmd>Grapple cycle forward<CR>", desc = "Next Mark" })
table.insert(keys, { "<C-A-h>", "<cmd>Grapple cycle backward<CR>", desc = "Prev Mark" })
-- stylua: ignore end

return {
  {
    "cbochs/grapple.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = { "Grapple" },
    keys = keys,
    config = function()
      require("grapple").setup()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("grapple")
      end)
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("m", "󰛢 " .. " Marks", "<cmd>Grapple toggle_tags<CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local grapple = {
        action = "Grapple toggle_tags",
        desc = " Marks",
        icon = "󰛢 ",
        key = "m",
      }

      grapple.desc = grapple.desc .. string.rep(" ", 43 - #grapple.desc)
      grapple.key_format = "  %s"

      table.insert(opts.config.center, 5, grapple)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, { require("grapple").statusline, cond = require("grapple").exists })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader><cr>"] = { name = "󰛢 marks" },
      },
    },
  },
}
