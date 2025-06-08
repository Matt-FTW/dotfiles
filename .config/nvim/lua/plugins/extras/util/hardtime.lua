return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
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
      "outline",
    },
    restriction_mode = "hint",
    disabled_keys = {
      ["<Up>"] = { "" },
      ["<Down>"] = { "" },
      ["<Left>"] = { "" },
      ["<Right>"] = { "" },
    },
  },
}
