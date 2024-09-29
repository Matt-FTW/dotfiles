local prefix = "<leader>m"

return {
  {
    "echasnovski/mini.visits",
    event = "BufEnter",
    opts = {},
    -- stylua: ignore
    keys = {
      { prefix .. "a", function() require("mini.visits").add_label() end, desc = "Add Label" },
      { prefix .. "r", function() require("mini.visits").remove_label() end, desc = "Remove Label" },
      { prefix .. "l", function() require("mini.visits").select_label("", nil) end, desc = "Select Label (cwd)", },
      { prefix .. "L", function() require("mini.visits").select_label("", "") end, desc = "Select Label (all)", },
      { prefix .. "p", function() require("mini.visits").select_path() end, desc = "Visited Path (cwd)", },
      { prefix .. "P", function() require("mini.visits").select_path("") end, desc = "Visited Path (all)", },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "marks", icon = "󰛢 " },
      },
    },
  },
}
