return {
  {
    "chrisgrieser/nvim-recorder",
    event = "VeryLazy",
    vscode = true,
    keys = {
      { "q", desc = "Start Recording" },
      { "Q", desc = "Play Recording" },
      { "<C-q>", desc = "Switch Slot" },
      { "cq", desc = "Edit Macro" },
      { "yq", desc = "Yank Macro" },
      { "dq", desc = "Delete All Macros" },
    },
    opts = {
      useNerdFontsIcons = false,
      slots = { "a", "b", "c", "d" },
      mapping = {
        startStopRecording = "q",
        playMacro = "Q",
        editMacro = "cq",
        switchSlot = "<C-q>",
        deleteAllMacros = "dq",
        yankMacro = "yq",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, require("recorder").displaySlots)
    end,
  },
}
