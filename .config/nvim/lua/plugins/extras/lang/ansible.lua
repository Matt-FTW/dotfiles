return {
  { import = "lazyvim.plugins.extras.lang.yaml" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ansible-lint", "ansible-language-server" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ansible = { "ansible-lint" },
      },
    },
  },
  {
    "mfussenegger/nvim-ansible",
    -- stylua: ignore
    keys = {
      { "<leader>tp", function() require("ansible").run() end, desc = "Run Ansible Playbooks" },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "ansible",
    },
  },
}
