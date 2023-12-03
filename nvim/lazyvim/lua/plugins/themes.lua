return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'arcticicestudio/nord-vim', lazy = true },
  { 'noahfrederick/vim-noctu',  lazy = true },
  { "folke/tokyonight.nvim",    lazy = true, priority = 1000, opts = {}, },
  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = { "rktjmp/lush.nvim" },
    requires = { "rktjmp/lush.nvim" }
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "nord",
      -- colorscheme = "noctu",
    },
  },
}
