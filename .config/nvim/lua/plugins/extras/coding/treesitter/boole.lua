return {
  "nat-418/boole.nvim",
  -- stylua: ignore
  keys = {
    { "<C-a>", "<cmd>Boole increment<cr>", expr = true, desc = "Increment" },
    { "<C-x>", "<cmd>Boole decrement<cr>", expr = true, desc = "Decrement" },
  },
  opts = {
    mappings = {
      increment = "<C-a>",
      decrement = "<C-x>",
    },
    -- User defined loops
    additions = {
      { "Foo", "Bar" },
      { "tic", "tac", "toe" },
    },
    allow_caps_additions = {
      { "enable", "disable" },
      { "Enable", "Disable" },
      { "ENABLE", "DISABLE" },
    },
  },
}
