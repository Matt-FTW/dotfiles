return {
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      show_icons = true,
    },
    keys = {
      {
        "<leader>h",
        function()
          require("arrow.ui").openMenu()
        end,
        desc = "Harpoon",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, require("arrow.statusline").text_for_statusline_with_icons())
    end,
  },
}
