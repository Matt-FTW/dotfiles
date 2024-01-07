return {
  {

    "luukvbaal/statuscol.nvim",
    event = { "LazyFile" },
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        ft_ignore = { "neo-tree", "neo-tree-popup", "alpha", "lazy", "mason", "dashboard" },
        segments = {
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            sign = { name = { "Diagnostic*" }, text = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
            click = "v:lua.ScSa",
          },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        },
      }
    end,
    config = function(_, opts)
      require("statuscol").setup(opts)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "󱈸" },
        topdelete = { text = "󱈸" },
        changedelete = { text = "┃" },
        untracked = { text = "┇" },
      },
      signcolumn = true,
      numhl = true,
    },
  },
}
