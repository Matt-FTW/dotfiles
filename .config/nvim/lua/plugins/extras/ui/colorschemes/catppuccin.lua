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
      integrations = {
        alpha = true,
        cmp = true,
        barbecue = {
          dim_dirname = true, -- directory name is dimmed by default
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        dap = true,
        dap_ui = true,
        dashboard = true,
        flash = true,
        headlines = true,
        gitsigns = true,
        harpoon = false,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        lsp_trouble = false,
        navic = { enabled = false, custom_bg = "lualine" },
        neotest = true,
        neogit = true,
        neotree = true,
        notify = true,
        noice = true,
        ufo = true,
        overseer = false,
        octo = false,
        rainbow_delimiters = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
        },
        symbols_outline = false,
        treesitter = true,
        treesitter_context = false,
        which_key = true,
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
            fill = { bg = palette.mantle },
            background = { bg = palette.mantle },
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
}
