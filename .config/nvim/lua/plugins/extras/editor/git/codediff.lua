local prefix_conflicts = "<leader>gc"
local prefix_diffs = "<leader>gd"

return {
  {
    "esmuellert/codediff.nvim",
    opts = {
      explorer = {
        width = 30,
        indent_markers = true,
        view_mode = "tree",
      },

      history = {
        position = "bottom",
        width = 40,
        height = 10,
      },

      keymaps = {
        explorer = {
          select = "<CR>",
          hover = "k",
          refresh = "r",
          toggle_view_mode = "i",
          stage_all = "S",
          unstage_all = "U",
          restore = "x",
        },
        conflict = {
          accept_incoming = "<leader>gct",
          accept_current = "<leader>gco",
          accept_both = "<leader>gcb",
          discard = "<leader>gcx",
        },
      },
    },
    cmd = "CodeDiff",
    keys = {
      { prefix_diffs .. "d", "<cmd>CodeDiff<cr>", desc = "Diff View" },
      { prefix_diffs .. "h", "<cmd>CodeDiff history<cr>", desc = "Diff History" },
      { prefix_diffs .. "f", "<cmd>CodeDiff history %<cr>", desc = "Diff File History" },
    },
  },
  {
    "sindrets/diffview.nvim",
    optional = true,
    enabled = false,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix_conflicts, group = "conflicts", icon = " " },
        { prefix_diffs, group = "diff", icon = " " },
      },
    },
  },
  {
    "folke/snacks.nvim",
    optional = true,
    keys = {
      { prefix_diffs, false },
      { "<leader>gD", false },
      { "<leader>gf", false },
    },
  },
}
