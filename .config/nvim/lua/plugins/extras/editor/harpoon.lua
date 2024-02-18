local keys = {}

-- stylua: ignore start
for i = 1, 9 do
  table.insert(keys, { "<leader>h" .. i, function() require("harpoon"):list():select(i) end, desc = "File " .. i })
end

table.insert(keys, { "<leader>ha", function() require("harpoon"):list():append() end, desc = "Add Mark" })
table.insert(keys, { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Menu" })
table.insert(keys, { "<leader>hf", "<cmd>Telescope harpoon marks<CR>", desc = "Files (Telescope)" })
table.insert(keys, { "<leader>hc", function() require("harpoon"):list():clear() end, desc = "Clear all Files" })

table.insert(keys, { "]H", function() require("harpoon"):list():next() end, desc = "Next Harpoon File" })
table.insert(keys, { "[H", function() require("harpoon"):list():prev() end, desc = "Prev Harpoon File" })

table.insert(keys, { "<C-A-l>", function() require("harpoon"):list():next() end, desc = "Next Harpoon File" })
table.insert(keys, { "<C-A-h>", function() require("harpoon"):list():prev() end, desc = "Prev Harpoon File" })
-- stylua: ignore end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    --stylua: ignore
    keys = keys,
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })

      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("harpoon")
      end)
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("h", "󱌧 " .. " Harpoon", "<cmd>Telescope harpoon marks<CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local harpoon = {
        action = "Telescope harpoon marks",
        desc = " Harpoon",
        icon = "󱌧 ",
        key = "h",
      }

      harpoon.desc = harpoon.desc .. string.rep(" ", 43 - #harpoon.desc)
      harpoon.key_format = "  %s"

      table.insert(opts.config.center, 5, harpoon)
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>h"] = { name = "󱌧 harpoon" },
      },
    },
  },
}
