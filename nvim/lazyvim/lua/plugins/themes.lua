local solarized_options = {
  transparent = vim.g.transparent_enabled, -- enable transparent background
  palette = 'solarized',                   -- or selenized
  -- palette = 'selenized',                   -- or selenized
  styles = {
    comments = {},
    functions = {},
    variables = {},
    numbers = {},
    constants = {},
    parameters = {},
    keywords = {},
    types = {},
  },
  enables = {
    bufferline = true,
    cmp = true,
    diagnostic = true,
    dashboard = true,
    editor = true,
    gitsign = true,
    hop = true,
    indentblankline = true,
    lsp = true,
    lspsaga = true,
    navic = true,
    neogit = true,
    neotree = true,
    notify = true,
    noice = true,
    semantic = true,
    syntax = true,
    telescope = true,
    tree = true,
    treesitter = true,
    todo = true,
    whichkey = true,
    mini = true,
  },
  highlights = {},
  colors = {},
  theme = 'default', -- or 'neo'
  -- theme = 'neo', -- or 'neo'
  autocmd = true,
}

local onedark_options = {
  -- Main options --
  style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- style = 'warm',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- style = 'darker',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- style = 'light',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
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
    keywords = 'bold',
    functions = 'bold',
    strings = 'none',
    variables = 'none'
  },

  -- Lualine options --
  lualine = {
    transparent = true, -- lualine center bar transparency
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
  -- require("plugins.themes.neosolarized"),

  -- add gruvbox
  -- { 'arcticicestudio/nord-vim',   lazy = true, event = "VeryLazy" },
  -- { 'noahfrederick/vim-noctu',    lazy = true, event = "VeryLazy" },
  -- { 'navarasu/onedark.nvim', lazy = true, event = "VeryLazy", opts = onedark_options },
  -- { 'HUAHUAI23/nvim-quietlight',  lazy = true, event = "VeryLazy" },
  -- { 'luisiacc/gruvbox-baby', lazy = true, event = "VeryLazy" },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = true,
  --   event = "VeryLazy",
  --   opts = {
  --     -- foreground option can be material, mix, or original
  --     -- gruvbox_material_foreground = "material",
  --     gruvbox_material_foreground = "mix",
  --     -- gruvbox_material_foreground = "original",
  --     --background option can be hard, medium, soft
  --     gruvbox_material_background = "soft",
  --     gruvbox_material_enable_italic = 1,
  --     gruvbox_material_better_performance = 1,
  --   }
  -- },

  {
    'lalitmee/cobalt2.nvim',
    lazy = true,
    -- priority = 1000,
    event = { "ColorSchemePre" }, -- if you want to lazy load
    dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
    config = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  {
    'maxmx03/solarized.nvim',
    lazy = true,
    priority = 1000,
    opts = solarized_options,
    config = function()
      vim.o.background = 'dark' -- or 'light'
      -- vim.o.background = 'light'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = material_options
  },

  -- {
  --   'neanias/everforest-nvim',
  --   lazy = true,
  --   event = "VeryLazy",
  --   priority = 1000,
  --
  --   config = function()
  --     require("everforest").setup({
  --       -- Your config here
  --       background = 'soft',
  --       -- background = 'medium',
  --       -- background = 'hard',
  --       ---How much of the background should be transparent. 2 will have more UI
  --       ---components be transparent (e.g. status line background)
  --       transparent_background_level = 0,
  --     })
  --   end
  -- },
  -- { 'rose-pine/neovim',           lazy = true, event = "VeryLazy" },
  -- { 'RRethy/nvim-base16',         lazy = true, event = "VeryLazy" },
  -- { 'NTBBloodbath/doom-one.nvim', lazy = true, event = "VeryLazy" },
  -- { 'navarasu/onedark.nvim',      lazy = true, event = "VeryLazy" },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    event = "VeryLazy",
    priority = 1000,
    opts = { transparent = vim.g.transparent_enabled },
  },
  -- {
  --   "mcchrish/zenbones.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --   -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --   dependencies = { "rktjmp/lush.nvim", lazy = true, event = "VeryLazy" },
  --   requires = { "rktjmp/lush.nvim" }
  -- },
  -- { 'rebelot/kanagawa.nvim',       lazy = true, event = "VeryLazy", opts = { theme = "dragon", } },
  -- { 'marko-cerovac/material.nvim', lazy = true, event = "VeryLazy" },
  -- { 'NLKNguyen/papercolor-theme',  lazy = true, event = "VimEnter" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
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
      -- colorscheme = "material-darker",
      -- colorscheme = "solarized",
      colorscheme = "cobalt2",
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
