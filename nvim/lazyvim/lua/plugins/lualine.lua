local local_opts = {
  -- component_separators = { left = '', right = '' },
  -- section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}

opts = {
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}

return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  -- event = 'VimEnter',
  event = 'LazyFile',
  opts = opts
}
