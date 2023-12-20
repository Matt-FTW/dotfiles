local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

return {
  "gbprod/yanky.nvim",
  optional = true,
  opts = {
    picker = {
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
    },
  },
  -- stylua: ignore
  keys = {
    {"<leader>sy", function() require("telescope").extensions.yank_history.yank_history({}) end, mode = {"n", "v"}, desc = "Yank History"},
  },
}
