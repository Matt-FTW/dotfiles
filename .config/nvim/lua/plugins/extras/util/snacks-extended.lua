return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      },
    },
    lazygit = {
      configure = false,
    },
    notifier = {
      style = "fancy",
    },
    terminal = {
      win = {
        position = "float",
      },
    },
    scroll = {
      animate = {
        duration = { step = 10, total = 150 },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>fz", function() Snacks.picker.zoxide() end, desc = "Zoxide" },
    { "<leader>S", function() Snacks.picker.spelling() end, desc = "Spelling" },
    { "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Open Line" },
  },
}
