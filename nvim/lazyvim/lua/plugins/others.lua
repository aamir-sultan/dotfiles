return {
  -- { "junegunn/fzf", run = ":call fzf#install()", lazy = false },
  -- { "junegunn/fzf.vim", lazy = false },
  { 'xiyaowong/transparent.nvim',     event = { "LazyFile", "VeryLazy" }, }, -- Enable Transparent theming of different theme
  { 'ThePrimeagen/vim-be-good',       event = { "LazyFile", "VeryLazy" }, }, -- Game for getting better at Vim
  { 'frazrepo/vim-rainbow',           event = { "LazyFile", "VeryLazy" }, }, -- Add the indentation colors to different indentation level
  { 'wellle/targets.vim',             event = { "LazyFile", "VeryLazy" }, }, -- Provides additional targets for commands
  { 'tpope/vim-sensible',             event = { "LazyFile", "VeryLazy" }, }, -- Sensible mappings for Vim
  { 'tpope/vim-fugitive',             event = { "LazyFile", "VeryLazy" }, }, -- Provides Git wrapper just like using git at terminal
  { 'WeiChungWu/vim-SystemVerilog',   event = { "LazyFile", "VeryLazy" }, }, -- Provides colors for System Verilog
  { 'nachumk/systemverilog.vim',      event = { "LazyFile", "VeryLazy" }, }, -- Provides colors for System Verilog
  { 'airblade/vim-gitgutter',         event = { "LazyFile", "VeryLazy" }, }, -- Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
  { 'preservim/tagbar',               event = { "LazyFile", "VeryLazy" }, }, -- Creates tags for files on fly
  { 'ludovicchabant/vim-gutentags',   event = { "LazyFile", "VeryLazy" }, }, -- Creates tags for all files in the directory based on .sg or .git hooks or similar can be defined also.
  { 'tmux-plugins/vim-tmux',          event = { "LazyFile", "VeryLazy" }, }, -- Syntax highlighting and commentin for .tmux.conf file
  { 'djoshea/vim-autoread',           event = { "LazyFile", "VeryLazy" }, }, -- Have Vim automatically reload a file that has changed externally
  { 'lambdalisue/nerdfont.vim',       event = { "LazyFile", "VeryLazy" }, }, -- Fundemental plugin to handle Nerd Fonts in Vim
  -- { 'ryanoasis/vim-devicons',        event = { "LazyFile", "VeryLazy" }, }, -- Adds file type icons to Vim plugins -- Is coverd by lambdalisue/nerdfont.vim
  -- { 'bagrat/vim-buffet',             event = { "LazyFile", "VeryLazy" }, }, -- IDE-like Vim tabline -- This is covered by LazyVim
  { 'vim-scripts/SearchComplete',     event = { "LazyFile", "VeryLazy" }, }, -- Tab completion of words inside of a search ('/')
  { 'mg979/vim-visual-multi',         event = { "LazyFile", "VeryLazy" }, },
  { 'christoomey/vim-tmux-navigator', event = { "LazyFile", "VeryLazy" }, },
  -- { 'ctrlpvim/ctrlp.vim',             lazy = true,                        event = "VimEnter", }, -- Buffer are already available via telescope <leade>fb
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
