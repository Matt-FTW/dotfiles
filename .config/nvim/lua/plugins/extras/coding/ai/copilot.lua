return {
  {
    import = "lazyvim.plugins.extras.coding.copilot",
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-CR>",
          accept_line = "<M-l>",
          accept_word = "<M-k>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-c>",
        },
      },
    },
    keys = {
      { "<leader>cI", "<cmd>Copilot toggle<cr>", desc = "Toggle IA" },
    },
  },
}
