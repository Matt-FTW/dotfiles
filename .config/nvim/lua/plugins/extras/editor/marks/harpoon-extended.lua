local prefix = "<leader>m"

local keys = {}

-- stylua: ignore start
for i = 1, 9 do
  table.insert(keys, { prefix .. i, function() require("harpoon"):list():select(i) end, desc = "File " .. i })
end

table.insert(keys, { prefix .. "a", function() require("harpoon"):list():add() end, desc = "Add Mark" })
table.insert(keys, { prefix .. "m", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Marks" })
table.insert(keys, { prefix .. "t", "<cmd>Telescope harpoon marks<CR>", desc = "Marks (Telescope)" })
table.insert(keys, { prefix .. "c", function() require("harpoon"):list():clear() end, desc = "Clear all Marks" })

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
    keys = keys,
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
          save_on_toggle = true,
        },
      })

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
      spec = {
        { prefix, group = "marks", icon = "󰛢 " },
      },
    },
  },
}
