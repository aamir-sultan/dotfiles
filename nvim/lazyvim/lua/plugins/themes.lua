return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'arcticicestudio/nord-vim', lazy = true },
  { 'noahfrederick/vim-noctu', lazy = true },
  { "folke/tokyonight.nvim", lazy = true, priority = 1000, opts = {}, },

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
