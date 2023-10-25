local util = require("lazyvim.util")

return {
  {
    "mbbill/undotree",
    event = "BufReadPost",
  },
  {
    "debugloop/telescope-undo.nvim",
    opts = {},
    config = function(_, opts)
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("undo")
      end)
    end,
  },
}
