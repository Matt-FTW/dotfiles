local prefix = "sr"

return {
  {
    "roobert/search-replace.nvim",
    opts = {
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    },
    -- stylua: ignore
    keys = {
    { prefix .. "b", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", desc = "Buffer", mode = "v" },
    { prefix .. "v", "<CMD>SearchReplaceWithinVisualSelection<CR>", desc = "Visual Selection", mode = "v" },
    { prefix .. "w", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", desc = "Word on Buffer", mode = "v" },

    { prefix .. "b", "<CMD>SearchReplaceSingleBufferOpen<CR>", desc = "Buffer", mode = "n" },
    { prefix .. "w", "<CMD>SearchReplaceSingleBufferCWord<CR>", desc = "Word on Buffer", mode = "n" },
    { prefix .. "W", "<CMD>SearchReplaceSingleBufferCWORD<CR>", desc = "WORD on Buffer", mode = "n" },
    { prefix .. "e", "<CMD>SearchReplaceSingleBufferCExpr<CR>", desc = "Expression on Buffer", mode = "n" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "replace", icon = " " },
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        prefix .. "p",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Project",
      },
    },
  },
}
