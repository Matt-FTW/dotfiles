return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  -- stylua: ignore
  keys = {
    { "<C-A-Left>",  function() require("smart-splits").resize_left() end,       desc = "Resize left" },
    { "<C-A-Down>",  function() require("smart-splits").resize_down() end,       desc = "Resize down" },
    { "<C-A-Up>",    function() require("smart-splits").resize_up() end,         desc = "Resize up" },
    { "<C-A-Right>", function() require("smart-splits").resize_right() end,      desc = "Resize right" },
    { "<C-h>",       function() require("smart-splits").move_cursor_left() end,  desc = "Move cursor left" },
    { "<C-j>",       function() require("smart-splits").move_cursor_down() end,  desc = "Move cursor down" },
    { "<C-k>",       function() require("smart-splits").move_cursor_up() end,    desc = "Move cursor up" },
    { "<C-l>",       function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right" },
  },
}
