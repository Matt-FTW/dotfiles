return {
  "haringsrob/nvim_context_vt",
  event = "LazyFile",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    prefix = " 󱞷",
    highlight = "NonText",
    min_rows = 7,
    disable_ft = { "markdown", "css" },
    -- Disable display of virtual text below blocks for indentation based
    -- languages like Python
    disable_virtual_lines_ft = { "yaml" },
  },
  keys = {
    { "<leader>ux", "<cmd>NvimContextVtToggle<CR>", desc = "Toggle Context" },
  },
}
