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
return {
  'maxmx03/solarized.nvim',
  lazy = true,
  priority = 1000,
  opts = solarized_options,
  config = function()
    vim.o.background = 'dark' -- or 'light'
    -- vim.o.background = 'light'
  end,
}
