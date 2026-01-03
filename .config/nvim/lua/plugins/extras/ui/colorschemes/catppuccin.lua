local palette = require("catppuccin.palettes").get_palette("macchiato")
local transparent_bg = require("catppuccin").options.transparent_background and "NONE" or palette.mantle

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      custom_highlights = {
        -- Blink Menu
        Pmenu = { bg = palette.base },
        PmenuSel = { bg = palette.surface1, style = { "bold" } },
        PmenuBar = { bg = palette.surface1 },
        BlinkCmpMenuBorder = { bg = palette.base },

        -- Snacks
        SnacksNotifierInfo = { fg = palette.lavender },
        SnacksNotifierIconInfo = { fg = palette.lavender },
        SnacksNotifierTitleInfo = { fg = palette.lavender, style = { "italic" } },
        SnacksNotifierFooterInfo = { link = "DiagnosticInfo" },
        SnacksNotifierBorderInfo = { fg = palette.lavender },
        SnacksPickerPreviewTitle = { fg = palette.crust, bg = palette.lavender },
        SnacksDashboardHeader = { fg = palette.lavender },

        ["@property"] = { fg = palette.lavender, style = require("catppuccin").options.styles.properties or {} },
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
        lualine = {
          macchiato = {
            normal = {
              a = { bg = palette.lavender, fg = palette.mantle, gui = "bold" },
              b = { bg = palette.surface0, fg = palette.lavender },
              c = { bg = transparent_bg, fg = palette.text },
            },

            inactive = {
              a = { bg = transparent_bg, fg = palette.lavender },
              b = { bg = transparent_bg, fg = palette.surface1, gui = "bold" },
              c = { bg = transparent_bg, fg = palette.overlay0 },
            },
          },
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
      highlights = require("catppuccin.special.bufferline").get_theme({
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
