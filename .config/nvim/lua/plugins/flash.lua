return {
  "folke/flash.nvim",
  optional = true,
  keys = {
    -- stylua: ignore
    {
      "s",
      mode = { "n", "x", "o" },
      function() require("flash").jump({ search = { mode = function(str) return "\\<" .. str end } }) end,
      desc = "Flash",
    },
  },
}
