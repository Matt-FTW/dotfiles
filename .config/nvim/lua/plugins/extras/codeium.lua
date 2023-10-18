return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<M-CR>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })

      vim.keymap.set("i", "<M-c>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
}
