return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          theme = "catppuccin",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            { "location", padding = { left = 1, right = 1 } },
          },
        },
      }
    end,
  },
}
