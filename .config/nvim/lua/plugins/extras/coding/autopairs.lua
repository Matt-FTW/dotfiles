return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "windwp/nvim-autopairs",
      opts = {},
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local Rule = require("nvim-autopairs.rule")
      local npairs = require("nvim-autopairs")
      local cond = require("nvim-autopairs.conds")

      npairs.add_rules({
        Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
          :use_regex(true)
          :set_end_pair_length(2),

        Rule("=", "")
          :with_pair(cond.not_inside_quote())
          :with_pair(function(opts)
            local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
            if last_char:match("[%w%=%s]") then
              return true
            end
            return false
          end)
          :replace_endpair(function(opts)
            local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
            local next_char = opts.line:sub(opts.col, opts.col)
            next_char = next_char == " " and "" or " "
            if prev_2char:match("%w$") then
              return "<bs> =" .. next_char
            end
            if prev_2char:match("%=$") then
              return next_char
            end
            if prev_2char:match("=") then
              return "<bs><bs>=" .. next_char
            end
            return ""
          end)
          :set_end_pair_length(0)
          :with_move(cond.none())
          :with_del(cond.none()),
      })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
