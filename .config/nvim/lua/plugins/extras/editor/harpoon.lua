return {
  {
    "ThePrimeagen/harpoon",
    --stylua: ignore
    keys = {
      { "<leader>'", function() require("harpoon.mark").add_file() end, desc = "Add File" },
      { "<leader>;", "<cmd>Telescope harpoon marks<CR>", desc = "Harpoon" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
      { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "File 4" },
      { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "File 5" },
      { "<leader>6", function() require("harpoon.ui").nav_file(6) end, desc = "File 6" },
    },
    opts = {
      globalsettings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
      },
    },
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("harpoon")
      end)
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local button = dashboard.button("m", " " .. " Marks", "<cmd>Telescope harpoon marks<CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 5, button)
    end,
  },
}
