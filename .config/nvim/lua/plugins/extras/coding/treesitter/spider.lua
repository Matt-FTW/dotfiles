return {
  "chrisgrieser/nvim-spider",
  opts = {},
  -- stylua: ignore
  keys = {
    { "e", mode = { "n", "o", "x" }, function() require("spider").motion("e") end, desc = "Spider-e" },
    { "w", mode = { "n", "o", "x" }, function() require("spider").motion("w") end, desc = "Spider-w" },
    { "b", mode = { "n", "o", "x" }, function() require("spider").motion("b") end, desc = "Spider-b" },
    { "E", mode = { "n", "x", "o" }, function() require("spider").motion("ge") end, desc = "Spider-E" },
  },
}
