return {
  {
    import = "lazyvim.plugins.extras.coding.yanky",
  },
  {
    "gbprod/yanky.nvim",
    opts = function(_, opts)
      local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")

      opts.highlight = { timer = 250 }
      opts.picker = {
        telescope = {
          use_default_mappings = false,
          mappings = {
            default = mapping.put("p"),
            i = {
              ["<c-g>"] = mapping.put("p"),
              ["<c-h>"] = mapping.put("P"),
              ["<c-x>"] = mapping.delete(),
              ["<c-r>"] = mapping.set_register(utils.get_default_register()),
            },
            n = {
              p = mapping.put("p"),
              P = mapping.put("P"),
              d = mapping.delete(),
              r = mapping.set_register(utils.get_default_register()),
            },
          },
        },
      }
    end,
    keys = {
      {
        "<leader>sy",
        function()
          local ok, telescope = pcall(require, "telescope")
          if ok then
            telescope.extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "v" },
        desc = "Yank History",
      },
    },
  },
}
