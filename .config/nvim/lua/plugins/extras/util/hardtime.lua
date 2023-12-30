return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "LazyFile",
  keys = {
    { "<leader>uH", "<cmd>Hardtime toggle<CR>", desc = "Toggle Hardtime" },
  },
  opts = {
    disabled_filetypes = {
      "qf",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "oil",
      "neo-tree",
      "symbols-outline",
      "vim-be-good",
      "oil",
    },
    restriction_mode = "hint",
    restricted_keys = {
      ["h"] = { "n", "x" },
      ["l"] = { "n", "x" },
      ["-"] = { "n", "x" },
      ["+"] = { "n", "x" },
      ["gj"] = { "n", "x" },
      ["gk"] = { "n", "x" },
      ["<C-N>"] = { "n", "x" },
      ["<C-P>"] = { "n", "x" },
    },
    disabled_keys = {
      ["<Up>"] = { "" },
      ["<Down>"] = { "" },
      ["<Left>"] = { "" },
      ["<Right>"] = { "" },
    },
  },
}
