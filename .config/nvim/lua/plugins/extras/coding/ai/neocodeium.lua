return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local neocodeium = require("neocodeium")
    neocodeium.setup()

    local commands = require("neocodeium.commands")
    cmp.event:on("menu_opened", function()
      commands.disable()
      neocodeium.clear()
    end)

    cmp.event:on("menu_closed", function()
      commands.enable()
    end)

    vim.keymap.set("i", "<M-CR>", function()
      require("neocodeium").accept()
    end)
    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept_word()
    end)
    vim.keymap.set("i", "<A-a>", function()
      require("neocodeium").accept_line()
    end)
    vim.keymap.set("i", "<M-]>", function()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<M-[>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<M-c>", function()
      require("neocodeium").clear()
    end)
  end,
}
