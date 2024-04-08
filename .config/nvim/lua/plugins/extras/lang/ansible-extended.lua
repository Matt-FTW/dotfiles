vim.filetype.add({
  pattern = {
    [".*/playbooks/.*%.yaml"] = "yaml.ansible",
    [".*/playbooks/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
    [".*/tasks/.*%.yaml"] = "yaml.ansible",
    [".*/tasks/.*%.yml"] = "yaml.ansible",
    [".*/vars/.*%.yaml"] = "yaml.ansible",
    [".*/vars/.*%.yml"] = "yaml.ansible",
    [".*/defaults/.*%.yaml"] = "yaml.ansible",
    [".*/defaults/.*%.yml"] = "yaml.ansible",
    [".*/handlers/.*%.yaml"] = "yaml.ansible",
    [".*/handlers/.*%.yml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
  },
})

return {
  { import = "plugins.extras.lang.yaml-extended" },
  { import = "lazyvim.plugins.extras.lang.ansible" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ansible-language-server" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ansible = { "ansible_lint" },
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "ansible",
      },
    },
  },
}
