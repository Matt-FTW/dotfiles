local macchiato = require("catppuccin.palettes").get_palette("macchiato")

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
      term_colors = true,
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
          style = "nvchad",
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
            fill = { bg = macchiato.mantle },
            background = { bg = macchiato.mantle },
          },
        },
      }),
    },
  },
}
