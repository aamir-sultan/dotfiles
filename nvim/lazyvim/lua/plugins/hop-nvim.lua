return {
  -- Better `movements`
  { 'phaazon/hop.nvim', Verylazy = true,
    opts = {
      -- Options would go here
    },
    keys = {
      -- disable the keymap to grep files
      -- {"<leader>/", false},
      -- change a keymap
      { "s", "<cmd> HopChar2<CR>", desc = "Find and Jump to two consecutive charachter" },
      { "ss", "<cmd> HopChar1<CR>", desc = "Find and Jump to single charachter" },
      { "sw", "<cmd> HopWord<CR>", desc = "Find and Jump to single word" },
      { "sa", "<cmd> HopAnywhere<CR>", desc = "Find and where" },
    },

    -- If activated this will not be lazy loaded.
    -- init = function()
    --   require('hop').setup(opts)
    -- end,
  }
}