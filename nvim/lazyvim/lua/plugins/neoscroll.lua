local neoscroll_opts = {
  -- mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
  --     '<C-u>', '<C-d>',
  --     '<C-b>', '<C-f>',
  --     '<C-y>', '<C-e>',
  --     'zt', 'zz', 'zb',
  --   },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = 'quadratic',        -- Default easing function
  -- easing = 'cubic',            -- Default easing function
  -- easing = 'quartic', -- Default easing function
  -- easing = 'quintic', -- Default easing function
  -- easing = 'circular', -- Default easing function
  -- easing = 'sine',           -- Default easing function
  -- easing = 'linear',        -- Default easing function
  pre_hook = nil,           -- Function to run before the scrolling animation starts
  post_hook = nil,          -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
}
return {
  "karb94/neoscroll.nvim",
  version = "*",
  lazy = true,
  event = "VimEnter",
  opts = neoscroll_opts,
}
