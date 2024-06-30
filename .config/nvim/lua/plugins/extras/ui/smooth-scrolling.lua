return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  config = function()
    require("cinnamon").setup({
      options = {
        delay = 5,
      },
    })

    local keymaps = {
      ["<C-u>"] = "<C-u>zz",
      ["<C-d>"] = "<C-d>zz",
      ["n"] = "nzzzv",
      ["N"] = "Nzzzv",
    }

    local scroll = require("cinnamon").scroll

    for key, value in pairs(keymaps) do
      vim.keymap.set("n", key, function()
        scroll(value)
      end)
    end
  end,
}
