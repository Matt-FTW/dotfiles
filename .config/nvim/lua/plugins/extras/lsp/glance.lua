return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", "<cmd>Glance definitions<cr>", desc = "Goto Definitions" },
            { "gr", "<cmd>Glance references<cr>", desc = "Goto References" },
            { "gy", "<cmd>Glance type_definitions<cr>", desc = "Goto T[y]pe Definitions" },
            { "gI", "<cmd>Glance implementations<cr>", desc = "Goto Implementations" },
          },
        },
      },
    },
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    event = "LspAttach",
    opts = {
      border = {
        enable = true,
      },
      use_trouble_qf = true,
      hooks = {
        before_open = function(results, open, jump, method)
          local uri = vim.uri_from_bufnr(0)
          if #results == 1 then
            local target_uri = results[1].uri or results[1].targetUri

            if target_uri == uri then
              jump(results[1])
            else
              open(results)
            end
          else
            open(results)
          end
        end,
      },
    },
  },
}
