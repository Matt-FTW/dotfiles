return {
  { import = "lazyvim.plugins.extras.ai.sidekick" },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          layout = "float",
          float = {
            width = 1,
            height = 1,
          },
        },
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
      nes = {
        enabled = false,
      },
      copilot = {
        status = {
          enabled = false,
          level = vim.log.levels.OFF,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<a-a>", function() require("sidekick.cli").toggle({ filter = { installed = true }}) end, desc = "Sidekick Toggle", mode = { "n", "t", "i", "x" } },
      { "<leader>aa", function() require("sidekick.cli").toggle({ filter = { installed = true }}) end, desc = "Sidekick Toggle" },
      { "<leader>as", function() require("sidekick.cli").select({ filter = { installed = true }}) end, desc = "Select CLI" },
    },
  },
}
