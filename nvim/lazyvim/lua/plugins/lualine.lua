local local_opts = {
  -- component_separators = { left = '', right = '' },
  -- section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}

opts = function()
  return {
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
  }
end

return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  event = 'VimEnter',
  opts = opts
}
