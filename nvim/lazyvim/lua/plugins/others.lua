return {
  { 'wellle/targets.vim',         event = { "LazyFile" }, },   -- Provides additional targets for commands
  { 'tpope/vim-sensible',         event = { "LazyFile" }, },   -- Sensible mappings for Vim
  { 'tpope/vim-fugitive',         event = { "LazyFile" }, },   -- Provides Git wrapper just like using git at terminal
  { 'tmux-plugins/vim-tmux',      event = { "LazyFile" }, },   -- Syntax highlighting and commenting for .tmux.conf file
  { 'djoshea/vim-autoread',       event = { "LazyFile" }, },   -- Have Vim automatically reload a file that has changed externally
  { 'vim-scripts/SearchComplete', event = { "LazyFile" }, },   -- Tab completion of words inside of a search ('/')
  { 'mg979/vim-visual-multi',     event = { "LazyFile" }, },
  -- {
  --   'echasnovski/mini.cursorword',
  --   event = { "LazyFile" },
  --   version = '*',
  --   init = function()
  --     require('mini.cursorword').setup()
  --   end,
  -- },
}
