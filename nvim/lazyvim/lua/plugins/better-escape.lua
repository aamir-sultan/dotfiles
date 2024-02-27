local better_comment_options = {
  mapping = { "ii", "jj" },  -- a table with mappings to use
  timeout = 150,             -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  -- timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  clear_empty_lines = false, -- clear line after escaping if there is only whitespace
  keys = "<Esc>",            -- keys used for escaping, if it is a function will use the result everytime
  -- example(recommended)
  -- keys = function()
  --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
  -- end,
}


return {
  -- {
  -- 'nvim-zh/better-escape.vim',
  -- -- lazy = true,
  -- -- event = "VimEnter",
  -- event = "VeryLazy",
  -- },
  {
    'max397574/better-escape.nvim',
    -- lazy = true,
    event = { "LazyFile" },
    opts = better_comment_options,
  },
}
