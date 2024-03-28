return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  -- stylua: ignore
  keys = {
    { "<C-A-Left>",  function() require("smart-splits").resize_left() end,       desc = "Resize Left" },
    { "<C-A-Down>",  function() require("smart-splits").resize_down() end,       desc = "Resize Down" },
    { "<C-A-Up>",    function() require("smart-splits").resize_up() end,         desc = "Resize Up" },
    { "<C-A-Right>", function() require("smart-splits").resize_right() end,      desc = "Resize Right" },
    { "<C-h>",       function() require("smart-splits").move_cursor_left() end,  desc = "Move Cursor Left" },
    { "<C-j>",       function() require("smart-splits").move_cursor_down() end,  desc = "Move Cursor Down" },
    { "<C-k>",       function() require("smart-splits").move_cursor_up() end,    desc = "Move Cursor Up" },
    { "<C-l>",       function() require("smart-splits").move_cursor_right() end, desc = "Move Cursor Right" },
  },
}
