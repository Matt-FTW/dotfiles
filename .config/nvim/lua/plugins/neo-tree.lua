return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    window = {
      mappings = {
        ["l"] = "open",
        ["e"] = function()
          vim.api.nvim_exec("Neotree focus filesystem left", true)
        end,
        ["b"] = function()
          vim.api.nvim_exec("Neotree focus buffers left", true)
        end,
        ["g"] = function()
          vim.api.nvim_exec("Neotree focus git_status left", true)
        end,
        ["h"] = "close_node",
        ["<c-/>"] = "fuzzy_finder_directory",
        ["D"] = function(state)
          local node = state.tree:get_node()
          local log = require("neo-tree.log")
          state.clipboard = state.clipboard or {}
          if diff_Node and diff_Node ~= tostring(node.id) then
            local current_Diff = node.id
            require("neo-tree.utils").open_file(state, diff_Node, open)
            vim.cmd("vert diffs " .. current_Diff)
            log.info("Diffing " .. diff_Name .. " against " .. node.name)
            diff_Node = nil
            current_Diff = nil
            state.clipboard = {}
            require("neo-tree.ui.renderer").redraw(state)
          else
            local existing = state.clipboard[node.id]
            if existing and existing.action == "diff" then
              state.clipboard[node.id] = nil
              diff_Node = nil
              require("neo-tree.ui.renderer").redraw(state)
            else
              state.clipboard[node.id] = { action = "diff", node = node }
              diff_Name = state.clipboard[node.id].node.name
              diff_Node = tostring(state.clipboard[node.id].node.id)
              log.info("Diff source file " .. diff_Name)
              require("neo-tree.ui.renderer").redraw(state)
            end
          end
        end,
      },
    },
    filesystem = {
      hijack_netrw_behavior = "open_default",
      window = {
        mappings = {
          ["O"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
          end,
        },
      },
    },
  },
}
