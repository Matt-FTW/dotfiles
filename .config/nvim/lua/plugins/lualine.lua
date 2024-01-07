return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    table.remove(opts.sections.lualine_x, 1)
    opts.sections.lualine_a = { { "mode", icon = "" } }
    opts.sections.lualine_y = { { "progress", icon = "", separator = " ", padding = { left = 1, right = 1 } } }
    opts.sections.lualine_z = { { "location", icon = "", padding = { left = 1, right = 1 } } }
    opts.extensions = {
      "lazy",
      "man",
      "mason",
      "nvim-dap-ui",
      "overseer",
      "quickfix",
      "toggleterm",
      "trouble",
      "neo-tree",
      "symbols-outline",
    }
  end,
}
