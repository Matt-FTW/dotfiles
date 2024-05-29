return {
  "folke/flash.nvim",
  opts = {},
  vscode = true,
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        })
      end,
      desc = "Flash",
    },
    {
      "<leader>*",
      function()
        require("flash").jump({ pattern = vim.fn.expand("<cword>") })
      end,
      desc = "Jump With Current Word",
    },
  },
}
