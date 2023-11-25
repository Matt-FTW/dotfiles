return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    opts = {
      pickers = {
        ["workspaces.nvim#workspaces"] = {
          disable = false,
          sorting = "frecency",
        },
        ["project.nvim#projects"] = {
          disable = false,
          sorting = "frecency",
        },
        ["yanky.nvim#yank_history"] = {
          disable = true,
        },
        ["zoxide.nvim#zoxide"] = {
          disable = true,
        },
      },
    },
  },
}
