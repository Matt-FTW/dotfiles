return {
  { "purarue/gitsigns-yadm.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      _on_attach_pre = function(_, callback)
        if vim.fn.executable("yadm") == 1 then
          require("gitsigns-yadm").yadm_signs(callback)
        else
          callback()
        end
      end,
    },
  },
}
