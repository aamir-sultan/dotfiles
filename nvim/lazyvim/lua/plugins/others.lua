return {
  -- { "junegunn/fzf", run = ":call fzf#install()", lazy = false },
  -- { "junegunn/fzf.vim", lazy = false },
  { 'ThePrimeagen/vim-be-good',       event = { "LazyFile", "VeryLazy" }, }, -- Game for getting better at Vim
  { 'xiyaowong/transparent.nvim',     event = { "LazyFile", "VeryLazy" }, }, -- Enable Transparent theming of different theme
  { 'frazrepo/vim-rainbow',           event = { "LazyFile", "VeryLazy" }, }, -- Add the indentation colors to different indentation level
  { 'wellle/targets.vim',             event = { "LazyFile", "VeryLazy" }, }, -- Provides additional targets for commands
  { 'tpope/vim-sensible',             event = { "LazyFile", "VeryLazy" }, }, -- Sensible mappings for Vim
  { 'tpope/vim-fugitive',             event = { "LazyFile", "VeryLazy" }, }, -- Provides Git wrapper just like using git at terminal
  { 'WeiChungWu/vim-SystemVerilog',   event = { "LazyFile", "VeryLazy" }, }, -- Provides colors for System Verilog
  { 'nachumk/systemverilog.vim',      event = { "LazyFile", "VeryLazy" }, }, -- Provides colors for System Verilog
  { 'airblade/vim-gitgutter',         event = { "LazyFile", "VeryLazy" }, }, -- Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
  { 'preservim/tagbar',               event = { "LazyFile", "VeryLazy" }, }, -- Creates tags for files on fly
  { 'ludovicchabant/vim-gutentags',   event = { "LazyFile", "VeryLazy" }, }, -- Creates tags for all files in the directory based on .sg or .git hooks or similar can be defined also. 
  { 'tmux-plugins/vim-tmux',          event = { "LazyFile", "VeryLazy" }, },
  { 'djoshea/vim-autoread',           event = { "LazyFile", "VeryLazy" }, },
  { 'lambdalisue/nerdfont.vim',       event = { "LazyFile", "VeryLazy" }, },
  -- { 'ryanoasis/vim-devicons', event = { "LazyFile", "VeryLazy" }, },
  { 'bagrat/vim-buffet',              event = { "LazyFile", "VeryLazy" }, },
  { 'vim-scripts/SearchComplete',     event = { "LazyFile", "VeryLazy" }, },
  { 'ervandew/supertab',              lazy = true, },
  { 'mg979/vim-visual-multi',         event = { "LazyFile", "VeryLazy" }, },
  -- { 'christoomey/vim-tmux-navigator', event = { "LazyFile", "VeryLazy" }, },
  { 'christoomey/vim-tmux-navigator', event = { "LazyFile", "VeryLazy" }, },
  { 'ctrlpvim/ctrlp.vim',             lazy = true,                        event = "VimEnter", },
  { 'nvim-zh/better-escape.vim',      lazy = true,                        event = "VimEnter", },
  -- { 'MunifTanjim/nui.nvim', lazy = true },
  -- { 'beauwilliams/statusline.lua' },
  -- {
  --   "numToStr/Comment.nvim",
  --   event = { "LazyFile", "VeryLazy" },
  --   -- keys = { "gcc", "gbc" },
  --   -- init = function()
  --   --   require("core.utils").load_mappings "comment"
  --   -- end,
  --   config = function(_, opts)
  --     require("Comment").setup(opts)
  --     local ft = require('Comment.ft')
  --     ft.systemverilog = { '//%s', '/*%s*/' }
  --   end,
  -- },
  -- { 'echasnovski/mini.animate', event = { "LazyFile", "VeryLazy" }, version = '*',
  --   init = function()
  --     require('mini.animate').setup()
  --   end,
  -- },
  {
    'echasnovski/mini.cursorword',
    event = { "LazyFile", "VeryLazy" },
    version = '*',
    init = function()
      require('mini.cursorword').setup()
    end,
  },
  -- {
  --   'echasnovski/mini.indentscope',
  --   event = { "LazyFile", "VeryLazy" },
  --   version = '*',
  --   init = function()
  --     require('mini.indentscope').setup()
  --   end,
  -- },
}
