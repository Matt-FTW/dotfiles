local Util = require("lazyvim.util")

return {
  {
    "debugloop/telescope-undo.nvim",
    opts = {},
    config = function(_, opts)
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("undo")
      end)
    end,
    keys = {
      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undos" },
    },
  },
}
