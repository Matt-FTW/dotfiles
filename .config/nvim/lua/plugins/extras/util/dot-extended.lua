---@type string
local xdg_config = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. "/.config"

---@param path string
local function have(path)
  return vim.loop.fs_stat(xdg_config .. "/" .. path) ~= nil
end

return {
  {
    import = "lazyvim.plugins.extras.util.dot",
  },
  {
    "luckasRanarison/tree-sitter-hypr",
    enabled = false,
  },
  {
    "luckasRanarison/tree-sitter-hyprlang",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if have("hypr") then
          if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, { "hyprlang" })
          end
        end
      end,
    },
    enabled = function()
      return have("hypr")
    end,
    event = "BufRead */hypr/*.conf",
    build = ":TSUpdate hyprlang",
  },
}
