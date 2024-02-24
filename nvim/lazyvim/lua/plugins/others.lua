return {
  { 'ThePrimeagen/vim-be-good',     event = { "LazyFile", "VeryLazy" }, }, -- Game for getting better at Vim
  { 'frazrepo/vim-rainbow',         event = { "LazyFile", "VeryLazy" }, }, -- Add the indentation colors to different indentation level
  { 'wellle/targets.vim',           event = { "LazyFile" }, }, -- Provides additional targets for commands
  { 'tpope/vim-sensible',           event = { "LazyFile" }, }, -- Sensible mappings for Vim
  { 'tpope/vim-fugitive',           event = { "LazyFile" }, }, -- Provides Git wrapper just like using git at terminal
  { 'preservim/tagbar',             event = { "LazyFile" }, }, -- Creates tags for files on fly
  { 'ludovicchabant/vim-gutentags', event = { "LazyFile" }, }, -- Creates tags for all files in the directory based on .sg or .git hooks or similar can be defined also.
  { 'tmux-plugins/vim-tmux',        event = { "LazyFile" }, }, -- Syntax highlighting and commenting for .tmux.conf file
  { 'djoshea/vim-autoread',         event = { "LazyFile" }, }, -- Have Vim automatically reload a file that has changed externally
  -- { 'lambdalisue/nerdfont.vim',     event = { "LazyFile", "VeryLazy" }, }, -- Fundemental plugin to handle Nerd Fonts in Vim
  { 'vim-scripts/SearchComplete',   event = { "LazyFile" }, }, -- Tab completion of words inside of a search ('/')
  { 'mg979/vim-visual-multi',       event = { "LazyFile" }, },
  {
    'echasnovski/mini.cursorword',
    event = { "LazyFile" },
    version = '*',
    init = function()
      require('mini.cursorword').setup()
    end,
  },
}
