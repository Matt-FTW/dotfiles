return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set("i", "<M-CR>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })

    vim.keymap.set("i", "<M-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })

    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })

    vim.keymap.set("i", "<M-c>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })

    vim.keymap.set("n", "<leader>cC", function()
      if vim.g.codeium_enabled == true then
        vim.cmd("CodeiumDisable")
      else
        vim.cmd("CodeiumEnable")
      end
    end, { noremap = true, desc = "Toggle Codeium" })
  end,
}
