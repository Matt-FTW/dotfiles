return {
  { import = "lazyvim.plugins.extras.lang.omnisharp" },
  {
    "nvim-neotest/neotest",
    optiona = true,
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {},
      },
    },
  },
}
