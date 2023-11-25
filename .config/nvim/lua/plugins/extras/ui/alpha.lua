return {
  "goolord/alpha-nvim",
  keys = {
    { "<leader>fa", "<cmd>Alpha<cr>", desc = "Dashboard (Alpha)" },
  },
  opts = function(_, dashboard)
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

    dashboard.section.header.val = vim.split(logo, "\n")
  -- stylua: ignore
    local button = dashboard.button("G", "󰊢 " .. " Git",       "<cmd>FloatermNew --disposable --name=lazygitroot --opener=edit --titleposition=center --height=0.85 --width=0.85 --cwd=<root> lazygit<CR>")
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
    table.insert(dashboard.section.buttons.val, 7, button)
    return dashboard
  end,
}
