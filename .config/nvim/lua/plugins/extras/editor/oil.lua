return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["q"] = "actions.close",
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader><bs>", function() require("oil").toggle_float() end, desc = "Toggle oil" },
  },
}
