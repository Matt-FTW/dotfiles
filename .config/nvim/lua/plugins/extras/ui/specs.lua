return {
  "edluffy/specs.nvim",
  opts = {},
  -- stylua: ignore
  keys = {
    { "<C-b>", function() require("specs").show_specs() end, desc = "Specs" },
  },
}
