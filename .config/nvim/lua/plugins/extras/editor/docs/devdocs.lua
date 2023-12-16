return {
  "luckasRanarison/nvim-devdocs",
  cmd = {
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsOpen",
    "DevdocsOpenFloat",
    "DevdocsOpenCurrent",
    "DevdocsOpenCurrentFloat",
    "DevdocsUpdate",
    "DevdocsUpdateAll",
  },
  keys = {
    { "<leader>sE", "<cmd>DevdocsOpen<cr>", desc = "Devdocs" },
    { "<leader>se", "<cmd>DevdocsOpenCurrent<cr>", desc = "Devdocs Current" },
  },
  opts = {
    dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
    telescope = {}, -- passed to the telescope picker
    float_win = { -- passed to nvim_open_win(), see :h api-floatwin
      relative = "editor",
      height = 25,
      width = 100,
      border = "rounded",
    },
    wrap = false, -- text wrap, only applies to floating window
    previewer_cmd = nil, -- for example: "glow"
    cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "80" }
    cmd_ignore = {}, -- ignore cmd rendering for the listed docs
    picker_cmd = false, -- use cmd previewer in picker preview
    picker_cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "50" }
    after_open = function(bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", {})
    end,
    ensure_installed = {
      "javascript",
      "lua-5.4",
      "fish-3.6",
      "git",
      "npm",
      "node",
    },
  },
}
