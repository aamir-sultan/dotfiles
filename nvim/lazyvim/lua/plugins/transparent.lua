return {
  "xiyaowong/transparent.nvim",
  -- event = "VimEnter",
  lazy = true,
  event = { "LazyFile", "VeryLazy" },
  cmd = { "TransparentToggle" }
  -- require('transparent').clear_prefix('NeoTree'), -- Not Working
} -- Enable Transparent theming of different theme
