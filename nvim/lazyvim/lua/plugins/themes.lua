return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'arcticicestudio/nord-vim', lazy = true },
  { 'noahfrederick/vim-noctu',  lazy = true },
  { "folke/tokyonight.nvim",    lazy = true, priority = 1000, opts = {}, },
  {
    "mcchrish/zenbones.nvim",
    lazy = true,
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = { "rktjmp/lush.nvim", lazy = true },
    requires = { "rktjmp/lush.nvim" }
  },
  { 'rebelot/kanagawa.nvim',       lazy = true },
  { 'marko-cerovac/material.nvim', lazy = true },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "kanagawabones",
      -- colorscheme = "nord",
      -- colorscheme = "noctu",
    },
  },
}
