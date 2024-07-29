return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<C-Left>",  function() require("smart-splits").resize_left() end,       desc = "Resize Left" },
    { "<C-Down>",  function() require("smart-splits").resize_down() end,       desc = "Resize Down" },
    { "<C-Up>",    function() require("smart-splits").resize_up() end,         desc = "Resize Up" },
    { "<C-Right>", function() require("smart-splits").resize_right() end,      desc = "Resize Right" },
    { "<C-h>",     function() require("smart-splits").move_cursor_left() end,  desc = "Move Cursor Left" },
    { "<C-j>",     function() require("smart-splits").move_cursor_down() end,  desc = "Move Cursor Down" },
    { "<C-k>",     function() require("smart-splits").move_cursor_up() end,    desc = "Move Cursor Up" },
    { "<C-l>",     function() require("smart-splits").move_cursor_right() end, desc = "Move Cursor Right" },
    { "<A-Left>",  function() require("smart-splits").swap_buf_left() end,     desc = "Swap Buffer Left" },
    { "<A-Down>",  function() require("smart-splits").swap_buf_down() end,     desc = "Swap Buffer Down" },
    { "<A-Up>",    function() require("smart-splits").swap_buf_up() end,       desc = "Swap Buffer Up" },
    { "<A-Right>", function() require("smart-splits").swap_buf_right() end,    desc = "Swap Buffer Right" },
  },
}
