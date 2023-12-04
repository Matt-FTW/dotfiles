return {
  "roobert/search-replace.nvim",
  opts = {
    default_replace_single_buffer_options = "gcI",
    default_replace_multi_buffer_options = "egcI",
  },
  -- stylua: ignore
  keys = {
  { "<leader>srb", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", desc = "Buffer", mode = "v" },
  { "<leader>srv", "<CMD>SearchReplaceWithinVisualSelection<CR>", desc = "Visual Selection", mode = "v" },
  { "<leader>srw", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", desc = "Word on Buffer", mode = "v" },

  {  "<leader>srb", "<CMD>SearchReplaceSingleBufferOpen<CR>", desc = "Buffer", mode = "n" },
  {  "<leader>srw", "<CMD>SearchReplaceSingleBufferCWord<CR>", desc = "Word on Buffer", mode = "n" },
  {  "<leader>srW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", desc = "WORD on Buffer", mode = "n" },
  {  "<leader>sre", "<CMD>SearchReplaceSingleBufferCExpr<CR>", desc = "Expression on Buffer", mode = "n" },
  {  "<leader>srf", "<CMD>SearchReplaceSingleBufferCFile<CR>", desc = "File on Buffer", mode = "n" },

  -- { "n", "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>", desc = "Search and Replace in Multi Buffer Selections" },
  -- { "n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", desc = "Search and Replace in Multi Buffer, Open" },
  -- { "n", "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>", desc = "Search and Replace in Multi Buffer (Current Word)" },
  -- { "n", "<leader>rbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", desc = "Search and Replace in Multi Buffer (Current WORD)" },
  -- { "n", "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>", desc = "Search and Replace in Multi Buffer (Current Expression)" },
  -- { "n", "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>", desc = "Search and Replace in Multi Buffer (Current File)" },
  },
}
