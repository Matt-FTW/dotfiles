local prefix = "<leader>gn"

return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    opts = {},
    keys = {
      { prefix .. "n", "<cmd>Neogit<cr>", desc = "Neogit (Root Dir)" },
      { prefix .. "c", "<cmd>Neogit commit<cr>", desc = "Commit" },
      { prefix .. "p", "<cmd>Neogit pull<cr>", desc = "Pull" },
      { prefix .. "P", "<cmd>Neogit push<cr>", desc = "Push" },
      { prefix .. "f", "<cmd>Neogit fetch<cr>", desc = "Fetch" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "neogit", icon = " " },
      },
    },
  },
}
