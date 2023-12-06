return {
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = { "LazyFile", "VeryLazy" },
    keys = { "gcc", "gbc" },
    -- init = function()
    --   require("core.utils").load_mappings "comment"
    -- end,
    config = function(_, opts)
      require("Comment").setup(opts)
      local ft = require('Comment.ft')
      ft.systemverilog = { '//%s', '/*%s*/' }
    end,

  }
}
