return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  opts = {
    sections = {
      definition = false,
      references = function(count)
        return "󰌹 Ref: " .. count
      end,
      implements = function(count)
        return "󰡱 Imp: " .. count
      end,
      git_authors = false,
    },
  },
  keys = {
    { "<leader>ue", "<cmd>LspLensToggle<cr>", desc = "Toggle Lsp Lens" },
  },
}
