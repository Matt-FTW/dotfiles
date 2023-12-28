return {
  "tomasky/bookmarks.nvim",
  config = function()
    require("bookmarks").setup({
      save_file = vim.fn.stdpath("state") .. "/bookmarks",
      keywords = {
        ["@t"] = "󰄵 ",
        ["@w"] = " ",
        ["@f"] = "󰁨 ",
        ["@n"] = " ",
      },
    })
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").setup({
        extensions = {
          repo = {
            list = {
              fd_opts = {
                "--no-ignore-vcs",
              },
              search_dirs = {
                "~/Repos/",
              },
            },
          },
        },
      })
      require("telescope").load_extension("bookmarks")
    end)
  end,
  -- stylua: ignore
  keys = {
    { "<leader>fB", "<cmd>Telescope bookmarks list<cr>", desc = "Bookmarks" },
    { "mm", function() require("bookmarks").bookmark_toggle() end, desc = "Toggle Bookmark" },
    { "ml", function() require("bookmarks").bookmark_ann() end, desc = "Add/Edit Current Line" },
    { "mc", function() require("bookmarks").bookmark_clean() end, desc = "Clear All Bookmarks" },
    { "mn", function() require("bookmarks").bookmark_next() end, desc = "Next Bookmark" },
    { "mp", function() require("bookmarks").bookmark_prev() end, desc = "Previous Bookmark" },
    { "]k", function() require("bookmarks").bookmark_next() end, desc = "Next Bookmark" },
    { "[k", function() require("bookmarks").bookmark_prev() end, desc = "Previous Bookmark" },
    { "mL", function() require("bookmarks").bookmark_list() end, desc = "List Bookmarks" },
  },
}
