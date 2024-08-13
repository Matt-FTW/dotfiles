return {
  "isakbm/gitgraph.nvim",
  opts = {
    symbols = {
      merge_commit = "",
      commit = "",
    },
    format = {
      timestamp = "%H:%M:%S %d-%m-%Y",
      fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
    hooks = {
      on_select_commit = function(commit)
        if LazyVim.has("diffview.nvim") then
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        else
          print("selected commit:", commit.hash)
        end
      end,
      on_select_range_commit = function(from, to)
        if LazyVim.has("diffview.nvim") then
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        else
          print("selected range:", from.hash, to.hash)
        end
      end,
    },
  },
  keys = {
    {
      "<leader>gl",
      function()
        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Graph",
    },
  },
}
