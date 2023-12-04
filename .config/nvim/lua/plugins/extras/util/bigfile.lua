return {
  "LunarVim/bigfile.nvim",
  event = "LazyFile",
  opts = {
    filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "vimopts",
      "matchparen",
    },
  },
}
