return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "LiadOz/nvim-dap-repl-highlights",
    opts = {},
  },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "dap_repl" })
    end
  end,
}
