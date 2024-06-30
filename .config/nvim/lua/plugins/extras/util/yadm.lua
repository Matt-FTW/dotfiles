return {
  { "seanbreckenridge/gitsigns-yadm.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      _on_attach_pre = function(_, callback)
        require("gitsigns-yadm").yadm_signs(callback)
      end,
    },
  },
}
