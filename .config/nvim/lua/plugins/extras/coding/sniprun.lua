return {
  {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    cmd = { "SnipRun", "SnipInfo", "SnipLive", "SnipClose", "SnipReset", "SnipReplMemoryClean" },
    opts = {
      selected_interpreters = {}, --# use those instead of the default for the current filetype
      repl_enable = { "javascript", "typescript" }, --# enable REPL-like behavior for the given interpreters
      repl_disable = {}, --# disable REPL-like behavior for the given interpreters

      interpreter_options = {
        GFM_original = {
          use_on_filetypes = { "markdown.pandoc" }, --# the 'use_on_filetypes' configuration key is
        },
        Python3_original = {
          error_truncate = "auto", --# Truncate runtime errors 'long', 'short' or 'auto'
        },
      },

      display = {
        "VirtualText", --# display results as virtual text
      },

      live_display = { "VirtualTextOk" }, --# display mode used in live_mode

      display_options = {
        terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
        terminal_line_number = false, --# whether show line number in terminal window
        terminal_signcolumn = false, --# whether show signcolumn in terminal window
        terminal_persistence = true, --# always keep the terminal open (true) or close it at every occasion (false)
        terminal_width = 45, --# change the terminal display option width
        notification_timeout = 5, --# timeout for nvim_notify output
      },

      --# You can use the same keys to customize whether a sniprun producing
      --# no output should display nothing or '(no output)'
      show_no_output = {
        "Classic",
        "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
      },

      live_mode_toggle = "off", --# live mode toggle, see Usage - Running for more info

      inline_messages = false, --# inline_message (0/1) is a one-line way to display messages

      borders = "single", --# display borders around floating windows
      --# possible values are 'none', 'single', 'double', or 'shadow'
    },
    -- stylua: ignore
    keys = {
      { "<leader>cur", "<cmd>SnipRun<cr>", desc = "Run" },
      { "<F6>", "<cmd>SnipRun<cr>", desc = "Run" },
      { "<leader>cur", function() require("sniprun").run("v") end, mode = { "v" }, desc = "Run" },
      { "<F6>", function() require("sniprun").run("v") end, mode = { "v" }, desc = "Run" },
      { "<leader>cui", function() require("sniprun").info() end, desc = "Info" },
      { "<leader>cuR", function() require("sniprun").reset() end, desc = "Reset" },
      { "<S-F6>", function() require("sniprun").reset() end, desc = "Reset" },
      { "<leader>cul", function() require("sniprun.live_mode").toggle() end, desc = "Live" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>cu"] = { name = "runner" },
      },
    },
  },
}
