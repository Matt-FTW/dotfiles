return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "purarue/gitsigns-yadm.nvim",
    },
    opts = {
      _on_attach_pre = function(bufnr, callback)
        if vim.fn.executable("yadm") == 1 then
          require("gitsigns-yadm").yadm_signs(callback, { bufnr = bufnr })
        else
          -- if optionally disabling the plugin, make sure to call
          -- 'callback' with no arguments
          callback()
        end
      end,
    },
  },
}
