return {
  "zbirenbaum/copilot.lua",
  enabled = false,
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
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
