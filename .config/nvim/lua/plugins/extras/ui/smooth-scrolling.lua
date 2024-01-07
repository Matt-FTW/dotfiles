local map = vim.keymap.set

return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  config = function()
    require("cinnamon").setup({
      default_keymaps = true,
      extra_keymaps = true,
      extended_keymaps = true,
      override_keymaps = true,
      default_delay = 2,
    })

    -- DEFAULT_KEYMAPS:

    -- Half-window movements:
    map({ "n", "x" }, "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
    map({ "n", "x" }, "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

    -- Page movements:
    map({ "n", "x" }, "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
    map({ "n", "x" }, "<C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
    map({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
    map({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

    -- EXTRA_KEYMAPS:

    -- Start/end of file and line number movements:
    map({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
    map({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>")

    -- Start/end of line:
    map({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
    map({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
    map({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

    -- Paragraph movements:
    map({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
    map({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

    -- Previous/next search result:
    map("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
    map("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
    map("n", "*", "<Cmd>lua Scroll('*', 1)<CR>")
    map("n", "#", "<Cmd>lua Scroll('#', 1)<CR>")
    map("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
    map("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

    -- Previous/next cursor location:
    map("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>")
    map("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

    -- Screen scrolling:
    map("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
    map("n", "zt", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
    map("n", "zb", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
    map("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>")
    map("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
    map("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>")
    map("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>")
    map("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>")
    map("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
    map("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

    -- Horizontal screen scrolling:
    map("n", "zH", "<Cmd>lua Scroll('zH')<CR>")
    map("n", "zL", "<Cmd>lua Scroll('zL')<CR>")
    map("n", "zs", "<Cmd>lua Scroll('zs')<CR>")
    map("n", "ze", "<Cmd>lua Scroll('ze')<CR>")
    map("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>")
    map("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>")

    -- EXTENDED_KEYMAPS:

    -- Up/down movements:
    map({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
    map({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
    map({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
    map({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

    -- Left/right movements:
    map({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
    map({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
    map({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
    map({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")
  end,
}
