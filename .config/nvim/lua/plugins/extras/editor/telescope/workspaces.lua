return {
  {
    "natecraddock/workspaces.nvim",
    event = "VeryLazy",
    cmd = {
      "Telescope workspaces",
      "WorkspacesAdd",
      "WorkspacesAddDir",
      "WorkspacesRemove",
      "WorkspacesRename",
      "WorkspacesOpen",
      "WorkspacesList",
      "WorkspacesListDirs",
    },
    config = function()
      require("workspaces").setup({
        hooks = {
          open = { "Telescope find_files" },
        },
      })
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("workspaces")
      end)
    end,
    keys = {
      { "<leader>fw", "<cmd>Telescope workspaces<cr>", desc = "Workspaces" },
    },
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("w", "󰭤 " .. " Workspaces", "<cmd>Telescope workspaces<CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local projects = {
        action = "Telescope workspaces",
        desc = " Workspaces",
        icon = "󰭤 ",
        key = "w",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      table.insert(opts.config.center, 4, projects)
    end,
  },
}
