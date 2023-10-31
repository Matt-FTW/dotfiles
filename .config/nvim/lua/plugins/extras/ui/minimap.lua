return {
  "echasnovski/mini.map",
  opts = function()
    local map = require("mini.map")
    return {
      symbols = {
        encode = require("mini.map").gen_encode_symbols.dot("4x2"),
      },
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.gitsigns(),
        map.gen_integration.diagnostic(),
      },
      window = {
        show_integration_count = false,
      },
    }
  end,
  keys = {
    { "<leader>um", "<Cmd>lua MiniMap.toggle()<CR>", desc = "Toggle Minimap" },
  },
}
