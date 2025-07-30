local palette = require("catppuccin.palettes").get_palette("macchiato") -- Import your favorite catppuccin colors

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      styles = {
        comments = { "italic" },
      },
      background = {
        light = "latte",
        dark = "macchiato",
      },
      term_colors = true,
      custom_highlights = function()
        return {
          Visual = { bg = palette.surface2 },
          FloatermBorder = { fg = palette.base },
          TelescopeMatching = { fg = palette.blue },
          TelescopeSelection = { fg = palette.text, bg = palette.surface0, bold = true },
          TelescopePromptPrefix = { bg = palette.surface0 },
          TelescopePromptNormal = { bg = palette.surface0 },
          TelescopeResultsNormal = { bg = palette.mantle },
          TelescopePreviewNormal = { bg = palette.mantle },
          TelescopePromptBorder = { bg = palette.surface0, fg = palette.surface0 },
          TelescopeResultsBorder = { bg = palette.mantle, fg = palette.mantle },
          TelescopePreviewBorder = { bg = palette.mantle, fg = palette.mantle },
          TelescopePromptTitle = { bg = palette.red, fg = palette.mantle },
          TelescopeResultsTitle = { fg = palette.mantle },
          TelescopePreviewTitle = { bg = palette.green, fg = palette.mantle },
        }
      end,
      auto_integrations = true,
      integrations = {
        snacks = {
          enabled = true,
          picker_style = "nvchad_outlined",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = {
              bg = palette.mantle,
            },
            separator_selected = {
              bg = palette.base,
              fg = palette.mantle,
            },
            separator = {
              bg = palette.mantle,
              fg = palette.mantle,
            },
            tab_separator = {
              bg = palette.mantle,
              fg = palette.mantle,
            },
            tab_selected = {
              bg = palette.base,
            },
            tab_separator_selected = {
              bg = palette.base,
              fg = palette.mantle,
            },
          },
        },
      }),
    },
  },
  {
    "rasulomaroff/reactive.nvim",
    optional = true,
    opts = {
      load = { "catppuccin-macchiato-cursor", "catppuccin-macchiato-cursorline" },
    },
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    optional = true,
    opts = {
      colors = palette,
      factors = {
        lightness = 0.9,
        chroma = 1,
        hue = 0.7,
      },
    },
  },
}
