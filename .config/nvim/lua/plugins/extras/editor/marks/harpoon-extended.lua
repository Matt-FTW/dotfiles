local keys = {}

-- stylua: ignore start
for i = 1, 9 do
  table.insert(keys, { "<leader>m" .. i, function() require("harpoon"):list():select(i) end, desc = "File " .. i })
end

table.insert(keys, { "<leader>ma", function() require("harpoon"):list():append() end, desc = "Add Mark" })
table.insert(keys, { "<leader>mm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Marks" })
table.insert(keys, { "<leader>mt", "<cmd>Telescope harpoon marks<CR>", desc = "Marks (Telescope)" })
table.insert(keys, { "<leader>mc", function() require("harpoon"):list():clear() end, desc = "Clear all Marks" })

table.insert(keys, { "]k", function() require("harpoon"):list():next() end, desc = "Next Mark" })
table.insert(keys, { "[k", function() require("harpoon"):list():prev() end, desc = "Prev Mark" })

table.insert(keys, { "<C-A-l>", function() require("harpoon"):list():next() end, desc = "Next Mark" })
table.insert(keys, { "<C-A-h>", function() require("harpoon"):list():prev() end, desc = "Prev Mark" })
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

      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("harpoon")
      end)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "abeldekat/harpoonline",
      opts = { formatter = "short", icon = "󰛢" },
    },
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, require("harpoonline").format)
    end,
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      -- stylua: ignore
      local button = dashboard.button("m", "󰛢 " .. " Marks", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)
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
        -- stylua: ignore
        action = function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
        desc = " Marks",
        icon = "󰛢 ",
        key = "m",
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
        ["<leader>m"] = { name = "󰛢 marks" },
      },
    },
  },
}
