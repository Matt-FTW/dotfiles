return {
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.ansible" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ansible-language-server" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.filetype.add({
        pattern = {
          [".*/playbooks/.*%.yaml"] = "yaml.ansible",
          [".*/playbooks/.*%.yml"] = "yaml.ansible",
          [".*/roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
          [".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
          [".*/roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
          [".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
        },
      })
    end,
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
