return {
  {
    "vuki656/package-info.nvim",
    event = {
      "BufRead package.json",
      "BufRead package-lock.json",
    },
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>ps", "<cmd>lua require('package-info').show({ force = true })<cr>", desc = "Show Package Versions" },
      { "<leader>pu", "<cmd>lua require('package-info').update()<cr>", desc = "Update Package" },
      { "<leader>pr", "<cmd>lua require('package-info').delete()<cr>", desc = "Remove Package" },
      { "<leader>pv", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Package Version" },
      { "<leader>pn", "<cmd>lua require('package-info').install()<cr>", desc = "Install New Dependency" },
    },
  },
  {
    "voldikss/vim-floaterm",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>pp", "<cmd>FloatermNew --disposable --name=lazynpm --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazynpm<CR>", desc = "Lazynpm",  },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = " packages" },
      },
    },
  },
}
