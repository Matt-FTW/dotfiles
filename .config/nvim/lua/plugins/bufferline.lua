local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = macchiato.mantle },
            background = { bg = macchiato.mantle },
          },
        },
      }),
      options = {
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        color_icons = true,
        separator_style = "slope",
      },
    },
  },
}
