return {
  "lewis6991/gitsigns.nvim",
  opts = {
    yadm = { enable = true },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 5,
      ignore_whitespace = false,
    },
  },
  keys = {
    -- stylua: ignore
    { "<leader>ub", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Blame" },
    { "<leader>uD", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deletions Inline" },
  },
}
