return {
  "lambdalisue/suda.vim",
  -- stylua: ignore
  keys = {
    { "<leader>W", ":SudaWrite<CR>", desc = "Suda Write" },
  },
  cmd = {
    "SudaRead",
    "SudaWrite",
  },
}
