return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim', lazy = true, event = "VimEnter" },
  { 'arcticicestudio/nord-vim', lazy = true, event = "VimEnter" },
  { 'noahfrederick/vim-noctu',  lazy = true, event = "VimEnter" },
  { 'navarasu/onedark.nvim',  lazy = true, event = "VimEnter" },
  { 'HUAHUAI23/nvim-quietlight',  lazy = true, event = "VimEnter" },
  { 'luisiacc/gruvbox-baby',  lazy = true, event = "VimEnter" },
  { 'rose-pine/neovim',  lazy = true, event = "VimEnter" },
  { 'RRethy/nvim-base16',  lazy = true, event = "VimEnter" },
  { 'NTBBloodbath/doom-one.nvim',  lazy = true, event = "VimEnter" },
  { 'navarasu/onedark.nvim',  lazy = true, event = "VimEnter" },
  -- { "folke/tokyonight.nvim",    lazy = true, event = "VimEnter" , priority = 1000, opts = {}, },
  {
    "mcchrish/zenbones.nvim",
    lazy = true,
    event = "VimEnter",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = { "rktjmp/lush.nvim", lazy = true, event = "VimEnter" },
    requires = { "rktjmp/lush.nvim" }
  },
  { 'rebelot/kanagawa.nvim',       lazy = true, event = "VimEnter", opts = { theme = "dragon", } },
  { 'marko-cerovac/material.nvim', lazy = true, event = "VimEnter" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-baby",
      -- colorscheme = "nvim-quietlight",
      -- colorscheme = "kanagawa",
      colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "nord",
      -- colorscheme = "noctu",
      -- colorscheme = "zenbones",
      -- colorscheme = "duckbones",
      -- colorscheme = "zenwritten",
      -- colorscheme = "neobones",
      -- colorscheme = "vimbones",
      -- colorscheme = "rosebones",
      -- colorscheme = "forestbones",
      -- colorscheme = "nordbones",
      -- colorscheme = "tokyobones",
      -- colorscheme = "seoulbones",
      -- colorscheme = "zenburned",
      -- colorscheme = "kanagawabones",
      -- colorscheme = "randombones",
    },
  },
}
