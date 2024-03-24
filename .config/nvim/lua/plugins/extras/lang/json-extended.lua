return {
  { import = "lazyvim.plugins.extras.lang.json" },
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
    cmd = { "JqxList", "JqxQuery" },
    keys = {
      { "<leader>cj", ft = { "json", "yaml" }, "<cmd>JqxList<cr>", desc = "Jqx List" },
    },
  },
}
