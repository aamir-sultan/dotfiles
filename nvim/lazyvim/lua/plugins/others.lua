return {
  -- { "junegunn/fzf", run = ":call fzf#install()", lazy = false },
  -- { "junegunn/fzf.vim", lazy = false },
  {'BlakeJC94/alpha-nvim-fortune', lazy = false }, -- Is used for the quote in the start screen
  { 'ThePrimeagen/vim-be-good', lazy = true },
  { 'frazrepo/vim-rainbow', lazy = true},
  { 'tpope/vim-sensible', lazy = true },
  { 'tpope/vim-fugitive', lazy = true },
  { 'WeiChungWu/vim-SystemVerilog', lazy = true },
  { 'nachumk/systemverilog.vim', lazy = true },
  { 'airblade/vim-gitgutter', lazy = true },
  { 'tmux-plugins/vim-tmux', lazy = true },
  { 'djoshea/vim-autoread', lazy = true },
  { 'lambdalisue/nerdfont.vim', lazy = true },
  { 'ryanoasis/vim-devicons', lazy = true },
  { 'bagrat/vim-buffet', lazy = true },
  { 'vim-scripts/SearchComplete', lazy = true },
  { 'ervandew/supertab', lazy = true },
  { 'mg979/vim-visual-multi', lazy = true },
  { 'christoomey/vim-tmux-navigator', lazy = true },
  { 'ctrlpvim/ctrlp.vim', lazy = false },
  { 'nvim-zh/better-escape.vim', lazy = false },
  -- { 'MunifTanjim/nui.nvim', lazy = true },
  -- { 'beauwilliams/statusline.lua' },
  {
    "numToStr/Comment.nvim", lazy = true,
    -- keys = { "gcc", "gbc" },
    -- init = function()
    --   require("core.utils").load_mappings "comment"
    -- end,
    config = function(_, opts)
      require("Comment").setup(opts)
      local ft = require('Comment.ft')
      ft.systemverilog = {'//%s', '/*%s*/'}
    end,
  },
  -- { 'echasnovski/mini.animate', lazy = true, version = '*',
  --   init = function()
  --     require('mini.animate').setup()
  --   end,
  -- },
  { 'echasnovski/mini.cursorword', lazy = true, version = '*',
    init = function()
      require('mini.cursorword').setup()
    end,
  },
  { 'echasnovski/mini.indentscope', lazy = true, version = '*',
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
