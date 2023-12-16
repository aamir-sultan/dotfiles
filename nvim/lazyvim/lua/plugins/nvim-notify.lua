return {
  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      -- render = "default",
      -- render = "compact",
      render = "wrapped-compact",
      -- top_down = true,
      top_down = false,
      -- stages = "fade",
      stages = "fade_in_slide_out",
      -- stages = "slide",
      level = 2,
      -- max_height = 0,
      -- max_height = 1,
      max_height = 2,

      -- max_height = function()
      --   return math.floor(vim.o.lines * 0.75)
      -- end,

      -- Default value will be used from core config.
      -- max_width = 1,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  }
}
