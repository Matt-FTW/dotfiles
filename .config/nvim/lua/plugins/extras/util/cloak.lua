return {
  "laytan/cloak.nvim",
  event = "BufRead .env*",
  cmd = { "CloakDisable", "CloakEnable", "CloakToggle" },
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>ck", function() require("cloak").toggle() end, desc = "Toggle Cloak" },
  },
}
