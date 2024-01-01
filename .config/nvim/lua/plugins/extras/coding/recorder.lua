return {
  {
    "chrisgrieser/nvim-recorder",
    dependencies = { "rcarriga/nvim-notify" },
    event = "VeryLazy",
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
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, require("recorder").displaySlots)
    end,
  },
}
