local hardtime_options = {
  max_time = 1000,
  max_time = 3,
  disable_mouse = false,
  hint = true,
  notification = true,
  allow_different_key = false,
  enabled = true,
  hints = {
    -- ["%$a"] = {
    --      message = function()
    --         return "Use A instead of $a"
    --      end,
    --      length = 2,
    --   },
  },
}
return {
  "m4xshen/hardtime.nvim",
  lazy = true,
  -- event = "VeryLazy",
  event = { "LazyFile", "VeryLazy" },
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- cmd = {"Hardtime"}
  opts = hardtime_options,
}   -- Help establish good command workflow and habit
