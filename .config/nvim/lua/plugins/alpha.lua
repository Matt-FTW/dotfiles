return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    optional = true,
    opts = function(_, dashboard)
            local logo = [[
            ███╗   ███╗ █████╗ ████████╗████████╗██╗   ██╗██╗███╗   ███╗   
            ████╗ ████║██╔══██╗╚══██╔══╝╚══██╔══╝██║   ██║██║████╗ ████║         
            ██╔████╔██║███████║   ██║      ██║   ██║   ██║██║██╔████╔██║     
            ██║╚██╔╝██║██╔══██║   ██║      ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║  
            ██║ ╚═╝ ██║██║  ██║   ██║      ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]
        dashboard.section.header.val = vim.split(logo, "\n")
      local button = dashboard.button("w", " " .. " Workspaces", ":Telescope workspaces <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  }
}
