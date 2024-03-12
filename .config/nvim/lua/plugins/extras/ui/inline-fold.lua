return {
  "malbertzard/inline-fold.nvim",
  init = function()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.html", "*.tsx", "*.jsx" },
      callback = function(_)
        if not require("inline-fold.module").isHidden then
          vim.cmd("InlineFoldToggle")
        end
      end,
    })
  end,
  ft = "html",
  cmd = "InlineFoldToggle",
  opts = {
    defaultPlaceholder = "…",
    queries = {
      html = {
        { pattern = 'class="([^"]*)"' },
        { pattern = 'href="(.-)"' },
        { pattern = 'src="(.-)"' },
      },
    },
  },
  keys = {
    { "<leader>uI", "<cmd>InlineFoldToggle<CR>", desc = "Toggle Inline Fold" },
  },
}
