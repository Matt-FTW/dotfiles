return {
  "2kabhishek/exercism.nvim",
  cmd = {
    "ExercismLanguages",
    "ExercismList",
    "ExercismSubmit",
    "ExercismTest",
  },
  dependencies = {
    "2kabhishek/utils.nvim", -- required, for utility functions
  },
  opts = {
    exercism_workspace = "~/dev/study/exercism",
    add_default_keybindings = false,
  },
}
