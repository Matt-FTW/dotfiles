return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  config = function()
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").load_extension("lazy")
    end)
  end,
  -- stylua: ignore
  keys = {
    { "<leader>sg", function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Grep (root dir)" },
    { "<leader>/", function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Grep (root dir)" },
  },
}
