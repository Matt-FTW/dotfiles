return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.options, {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    })

    opts.sections.lualine_a = { { "mode", icon = "" } }
    opts.sections.lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 1 } } }
    opts.sections.lualine_z = { { "location", padding = { left = 1, right = 1 } } }
  end,
  keys = {
    {
      "<leader>uS",
      function()
        if vim.opt.laststatus:get() == 0 then
          vim.opt.laststatus = 3
        else
          vim.opt.laststatus = 0
        end
      end,
      desc = "Toggle Statusline",
    },
  },
}
