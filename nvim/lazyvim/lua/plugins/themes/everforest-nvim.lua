return {
  'neanias/everforest-nvim',
  lazy = true,
  event = "VeryLazy",
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
}
