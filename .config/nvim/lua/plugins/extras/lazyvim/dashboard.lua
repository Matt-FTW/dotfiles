return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    vim.api.nvim_create_autocmd("TabNewEntered", { command = "Dashboard" })

    local logo = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
      ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
    return opts
  end,
  keys = {
    { "<leader>fd", "<cmd>Dash<cr>", desc = "Dashboard" },
  },
}
