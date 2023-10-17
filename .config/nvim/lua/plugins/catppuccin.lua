return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        barbecue = {
          dim_dirname = true, -- directory name is dimmed by default
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        flash = true,
        headlines = false,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
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
        navic = { enabled = false, custom_bg = "lualine" },
        neotest = false,
        neotree = true,
        notifier = false,
        noice = true,
        ufo = true,
        overseer = false,
        rainbow_delimiters = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        lsp_trouble = false,
        symbols_outline = false,
        treesitter = true,
        treesitter_context = false,
        which_key = true,
      },
    },
  },
}
