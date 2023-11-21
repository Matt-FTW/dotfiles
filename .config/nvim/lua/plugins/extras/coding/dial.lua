return {
  "monaqa/dial.nvim",
  -- stylua: ignore
  keys = {
    { "<A-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
    { "<A-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
        augend.constant.new({ elements = { "let", "const" } }),
        augend.semver.alias.semver,
      },
    })
  end,
}
