return {
  "uga-rosa/ccc.nvim",
  init = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function()
        local firstline = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
        if vim.endswith(firstline, "vim-pseudo-modeline: buffer_has_colors") then
          vim.cmd.CccHighlighterEnable()
        end
      end,
    })
  end,
  ft = { "css", "scss", "sh" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>up", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Paint/Colorizer" },
    { "<A-C>", "<cmd>CccConvert<cr>", desc = "Convert color" },
    { "<S-c>", "<cmd>CccPick<cr>", desc = "Pick Color" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}
