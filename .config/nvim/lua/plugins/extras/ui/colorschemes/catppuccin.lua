local palette = require("catppuccin.palettes").get_palette("macchiato")
local darken = require("catppuccin.utils.colors").darken
local transparent_bg = require("catppuccin").options.transparent_background and "NONE" or palette.mantle

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      custom_highlights = {
        -- Blink Menu
        Pmenu = { bg = darken(palette.surface0, 0.8, palette.crust) },
        PmenuSel = { bg = palette.surface1, style = { "bold" } },
        PmenuBar = { bg = palette.surface1 },
        BlinkCmpMenuBorder = { bg = darken(palette.surface0, 0.8, palette.crust) },

        -- Snacks
        SnacksNotifierInfo = { fg = palette.lavender },
        SnacksNotifierIconInfo = { fg = palette.lavender },
        SnacksNotifierTitleInfo = { fg = palette.lavender, style = { "italic" } },
        SnacksNotifierFooterInfo = { link = "DiagnosticInfo" },
        SnacksNotifierBorderInfo = { fg = palette.lavender },
        SnacksPickerPreviewTitle = { fg = palette.crust, bg = palette.lavender },
        SnacksDashboardHeader = { fg = palette.lavender },
      },
      styles = {
        comments = { "italic" },
      },
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true,
      term_colors = true,
      auto_integrations = true,
      integrations = {
        snacks = {
          enabled = true,
          indent_scope_color = "lavender",
        },
      },
      float = {
        transparent = true, -- enables transparency on floating windows
        solid = true, -- use nvchad styling for floating windows
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
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { bg = palette.lavender, fg = palette.mantle, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.lavender },
            c = { bg = transparent_bg, fg = palette.text },
          },

          insert = {
            a = { bg = palette.green, fg = palette.base, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.green },
          },

          terminal = {
            a = { bg = palette.green, fg = palette.base, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.green },
          },

          command = {
            a = { bg = palette.peach, fg = palette.base, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.peach },
          },

          visual = {
            a = { bg = palette.mauve, fg = palette.base, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.mauve },
          },

          replace = {
            a = { bg = palette.red, fg = palette.base, gui = "bold" },
            b = { bg = palette.surface0, fg = palette.red },
          },

          inactive = {
            a = { bg = transparent_bg, fg = palette.lavender },
            b = { bg = transparent_bg, fg = palette.surface1, gui = "bold" },
            c = { bg = transparent_bg, fg = palette.overlay0 },
          },
        },
      },
    },
  },
}
