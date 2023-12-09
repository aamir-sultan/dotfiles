onedark_options = {
  -- Main options --
  style = 'dark',                 -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- transparent = true,  -- Show/hide background
  transparent = false,            -- Show/hide background
  term_colors = true,             -- Change terminal color as per the selected theme style
  ending_tildes = false,          -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false,   -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Lualine options --
  lualine = {
    transparent = false,     -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {},       -- Override default colors
  highlights = {},   -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true,         -- darker colors for diagnostic
    undercurl = true,      -- use undercurl instead of underline for diagnostics
    background = true,     -- use background color for virtual text
  },
}

return {
  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim',   lazy = true, event = "VimEnter" },
  { 'arcticicestudio/nord-vim',   lazy = true, event = "VimEnter" },
  { 'noahfrederick/vim-noctu',    lazy = true, event = "VimEnter" },
  { 'navarasu/onedark.nvim',      lazy = true, event = "VimEnter", opts = onedark_options },
  { 'HUAHUAI23/nvim-quietlight',  lazy = true, event = "VimEnter" },
  { 'luisiacc/gruvbox-baby',      lazy = true, event = "VimEnter" },
  { 'rose-pine/neovim',           lazy = true, event = "VimEnter" },
  { 'RRethy/nvim-base16',         lazy = true, event = "VimEnter" },
  { 'NTBBloodbath/doom-one.nvim', lazy = true, event = "VimEnter" },
  { 'navarasu/onedark.nvim',      lazy = true, event = "VimEnter" },
  { 'folke/tokyonight.nvim',
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {transparent = vim.g.transparent_enabled},
  },
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
  { 'NLKNguyen/papercolor-theme',  lazy = true, event = "VimEnter" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "gruvbox-baby",
      -- colorscheme = "nvim-quietlight",
      -- colorscheme = "kanagawa",
      -- colorscheme = "kanagawa-dragon",
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
