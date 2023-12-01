return {
  {
    "epwalsh/pomo.nvim",
    cmd = { "TimerStart", "TimerStop", "TimerRepeat" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {
      notifiers = {
        {
          name = "Default",
          opts = {
            sticky = false,
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local function pomoTimer()
        local ok, pomo = pcall(require, "pomo")
        if not ok then
          return ""
        end

        local timer = pomo.get_first_to_finish()
        if timer == nil then
          return ""
        end

        return "󰄉 " .. tostring(timer)
      end
      table.insert(opts.sections.lualine_x, { pomoTimer })
    end,
  },
}
