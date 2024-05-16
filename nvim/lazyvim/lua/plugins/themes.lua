onedark_options = {
  -- Main options --
  style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- transparent = true,  -- Show/hide background
  transparent = false,          -- Show/hide background
  term_colors = true,           -- Change terminal color as per the selected theme style
  ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

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
    transparent = false, -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {},     -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}

material_options = {
  contrast = {
    terminal = false,            -- Enable contrast for the built-in terminal
    sidebars = false,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false,    -- Enable contrast for floating windows
    cursor_line = false,         -- Enable darker background for the cursor line
    lsp_virtual_text = false,    -- Enable contrasted background for lsp virtual text
    non_current_windows = false, -- Enable contrasted background for non-current windows
    filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { --[[ italic = true ]] },
    strings = { --[[ bold = true ]] },
    keywords = { --[[ underline = true ]] },
    functions = { --[[ bold = true, undercurl = true ]] },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    -- "coc"
    -- "dap",
    "dashboard",
    -- "eyeliner",
    -- "fidget",
    "flash",
    -- "gitsigns",
    "harpoon",
    "hop",
    "illuminate",
    "indent-blankline",
    -- "lspsaga",
    "mini",
    -- "neogit",
    -- "neotest",
    "neo-tree",
    -- "neorg",
    "noice",
    "nvim-cmp",
    "nvim-navic",
    -- "nvim-tree",
    "nvim-web-devicons",
    -- "rainbow-delimiters",
    -- "sneak",
    "telescope",
    "trouble",
    "which-key",
    "nvim-notify",
  },

  disable = {
    colored_cursor = true, -- Disable the colored cursor
    borders = false,       -- Disable borders between verticaly split windows
    background = false,    -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false,   -- Prevent the theme from setting terminal colors
    eob_lines = false      -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false   -- Enable higher contrast text for darker style
  },

  lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
  async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)
  custom_colors = nil,       -- If you want to override the default colors, set this to a function
  custom_highlights = {},    -- Overwrite highlights with your own
}

return {
  require("plugins.themes.neosolarized"),

  -- add gruvbox
  -- { 'arcticicestudio/nord-vim',   lazy = true, event = "VimEnter" },
  -- { 'noahfrederick/vim-noctu',    lazy = true, event = "VimEnter" },
  -- { 'navarasu/onedark.nvim',      lazy = true, event = "VimEnter", opts = onedark_options },
  -- { 'HUAHUAI23/nvim-quietlight',  lazy = true, event = "VimEnter" },
  { 'luisiacc/gruvbox-baby', lazy = true, event = "VimEnter" },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
    event = 'VimEnter',
    opts = material_options
  },

  {
    'neanias/everforest-nvim',
    lazy = true,
    event = "VimEnter",
    priority = 1000,

    config = function()
      require("everforest").setup({
        -- Your config here
        background = 'soft',
        -- background = 'medium',
        -- background = 'hard',
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 0,
      })
    end
  },
  -- { 'rose-pine/neovim',           lazy = true, event = "VimEnter" },
  -- { 'RRethy/nvim-base16',         lazy = true, event = "VimEnter" },
  -- { 'NTBBloodbath/doom-one.nvim', lazy = true, event = "VimEnter" },
  -- { 'navarasu/onedark.nvim',      lazy = true, event = "VimEnter" },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = { transparent = vim.g.transparent_enabled },
  },
  -- {
  --   "mcchrish/zenbones.nvim",
  --   lazy = true,
  --   event = "VimEnter",
  --   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --   -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --   dependencies = { "rktjmp/lush.nvim", lazy = true, event = "VimEnter" },
  --   requires = { "rktjmp/lush.nvim" }
  -- },
  -- { 'rebelot/kanagawa.nvim',       lazy = true, event = "VimEnter", opts = { theme = "dragon", } },
  -- { 'marko-cerovac/material.nvim', lazy = true, event = "VimEnter" },
  -- { 'NLKNguyen/papercolor-theme',  lazy = true, event = "VimEnter" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "blue",
      -- colorscheme = "duckbones",
      -- colorscheme = "doom-one",
      -- colorscheme = "forestbones",
      -- colorscheme = "gruvbox-baby",
      -- colorscheme = "kanagawa",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawabones",
      colorscheme = "material-darker",
      -- colorscheme = "neobones",
      -- colorscheme = "noctu",
      -- colorscheme = "nord",
      -- colorscheme = "nordbones",
      -- colorscheme = "nvim-quietlight",
      -- colorscheme = "randombones",
      -- colorscheme = "rosebones",
      -- colorscheme = "seoulbones",
      -- colorscheme = "tokyobones",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "vimbones",
      -- colorscheme = "zenbones",
      -- colorscheme = "zenburned",
      -- colorscheme = "zenwritten",
    },
  },
}
