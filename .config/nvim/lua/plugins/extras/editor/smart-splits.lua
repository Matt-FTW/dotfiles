return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  -- stylua: ignore
  keys = {
    { "<C-A-Left>",   function() require("smart-splits").resize_left() end,       desc = "Resize left",       mode = "n" },
    { "<C-A-Down>",   function() require("smart-splits").resize_down() end,       desc = "Resize down",       mode = "n" },
    { "<C-A-Up>",   function() require("smart-splits").resize_up() end,         desc = "Resize up",         mode = "n" },
    { "<C-A-Right>",   function() require("smart-splits").resize_right() end,      desc = "Resize right",      mode = "n" },
    { "<C-h>",   function() require("smart-splits").move_cursor_left() end,  desc = "Move cursor left",  mode = "n" },
    { "<C-j>",   function() require("smart-splits").move_cursor_down() end,  desc = "Move cursor down",  mode = "n" },
    { "<C-k>",   function() require("smart-splits").move_cursor_up() end,    desc = "Move cursor up",    mode = "n" },
    { "<C-l>",   function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right", mode = "n" },
    { "<C-A-h>", function() require("smart-splits").swap_buf_left() end,     desc = "Swap buffer left",  mode = "n" },
    { "<C-A-j>", function() require("smart-splits").swap_buf_down() end,     desc = "Swap buffer down",  mode = "n" },
    { "<C-A-k>", function() require("smart-splits").swap_buf_up() end,       desc = "Swap buffer up",    mode = "n" },
    { "<C-A-l>", function() require("smart-splits").swap_buf_right() end,    desc = "Swap buffer right", mode = "n" },
  },
}
