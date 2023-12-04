return {
  -- -- { "junegunn/fzf", run = ":call fzf#install()", lazy = false },
  -- -- { "junegunn/fzf.vim", lazy = false },
  { 'BlakeJC94/alpha-nvim-fortune',   lazy = true,                        event = "VimEnter", }, -- Is used for the quote in the start screen
  { 'ThePrimeagen/vim-be-good',       event = { "LazyFile", "VeryLazy" }, },
  { 'xiyaowong/transparent.nvim',     event = "VimEnter", },
  { 'frazrepo/vim-rainbow',           lazy = true },
  { 'wellle/targets.vim',             event = { "LazyFile", "VeryLazy" }, }, -- Provides additional targets for commands
  { 'tpope/vim-sensible',             event = { "LazyFile", "VeryLazy" }, },
  { 'tpope/vim-fugitive',             event = { "LazyFile", "VeryLazy" }, },
  -- { 'WeiChungWu/vim-SystemVerilog', event = { "LazyFile", "VeryLazy" }, },  -- Creating issues with tabs of LazyVim
  { 'nachumk/systemverilog.vim',      event = { "LazyFile", "VeryLazy" }, },
  { 'airblade/vim-gitgutter',         event = { "LazyFile", "VeryLazy" }, },
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
  {
    "numToStr/Comment.nvim",
    event = { "LazyFile", "VeryLazy" },
    -- keys = { "gcc", "gbc" },
    -- init = function()
    --   require("core.utils").load_mappings "comment"
    -- end,
    config = function(_, opts)
      require("Comment").setup(opts)
      local ft = require('Comment.ft')
      ft.systemverilog = { '//%s', '/*%s*/' }
    end,
  },
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
  {
    'echasnovski/mini.indentscope',
    event = { "LazyFile", "VeryLazy" },
    version = '*',
    init = function()
      require('mini.indentscope').setup()
    end,
  },
  {
    -- "strash/everybody-wants-that-line.nvim", lazy = true,
    -- config = function()
    -- [your configuration here]
    -- end
  }
}
