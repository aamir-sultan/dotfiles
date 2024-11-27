Comment_options = {
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = 'gcc',
    ---Block-comment toggle keymap
    block = 'gbc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = 'gc',
    ---Block-comment keymap
    block = 'gb',
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = 'gcO',
    ---Add comment on the line below
    below = 'gco',
    ---Add comment at the end of line
    eol = 'gcA',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
}

return {
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  --  {
  --    "echasnovski/mini.comment",
  --    lazy = true,
  --    event = { "LazyFile" },
  --    opts = {
  --      options = {
  --        -- custom_commentstring = function()
  --        --   return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
  --        -- end,
  --        custom_commentstring = function()
  --          local ext = vim.fn.expand('%:e') -- Get the file extension
  --
  --          -- Define custom comment strings for specific file types
  --          local commentstrings = {
  --            -- lua = "-- %s",        -- Lua comment string
  --            -- py = "# %s",          -- Python comment string
  --            -- js = "// %s",         -- JavaScript comment string
  --            -- html = "<!-- %s -->", -- HTML comment string
  --            v = "// %s",
  --            vh = "// %s",
  --            sv = "// %s",
  --            svh = "// %s",
  --            -- Add more custom comment strings as needed
  --          }
  --
  --          -- Return the custom comment string based on the file extension
  --          local commentstring = commentstrings[ext]
  --          if commentstring then
  --            return commentstring
  --          else
  --            -- Fallback to treesitter or default commentstring
  --            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
  --          end
  --        end,
  --      },
  --    },
  --  },
  -- {
  --   "numToStr/Comment.nvim",
  --   lazy = true,
  --   event = { "LazyFile" },
  --   keys = { "gcc", "gbc" },
  --   -- init = function()
  --   --   require("core.utils").load_mappings "comment"
  --   -- end,
  --   opts = Comment_options,
  --   config = function(_, opts)
  --     require("Comment").setup(opts)
  --     local ft = require('Comment.ft')
  --     ft.systemverilog = { '//%s', '/*%s*/' }
  --   end,
  --
  -- }
}
