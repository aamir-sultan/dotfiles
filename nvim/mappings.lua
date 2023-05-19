local M = {}

-- M.tmux = {
--   n = {
--     ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window Left"},
--     ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window Right"},
--     ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window Down"},
--     ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window Up"},
--   }
-- }
--

M.NeoTree = {
  n = {
    ["<C-n>"] = { ":NeoTreeShowToggle<CR>", "Toggle the NeoTree" },
    -- ["fs"] = {":HopChar1<CR>", "Find and Jump to single charachter"},
    -- ["fw"] = {":HopWord<CR>", "Find and Jump to single word"},
    -- ["fa"] = {":HopAnywhere<CR>", "Find and Jump to any single word"},
  }
}

M.hopkeys = {
  n = {
    ["f"] = {":HopChar2<CR>", "Find and Jump to two consecutive charachter"},
    ["fs"] = {":HopChar1<CR>", "Find and Jump to single charachter"},
    ["fw"] = {":HopWord<CR>", "Find and Jump to single word"},
    ["fa"] = {":HopAnywhere<CR>", "Find and Jump to any single word"},
  }
}

M.userkeys = {
  n = {
    -- opts is an optional parameter
    -- ["keys"] = {"action", "description", opts = {}},

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- cycle through buffers
    ["<C-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<C-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    -- cycle through buffers
    ["<C-S-Right>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<C-S-left>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  }
}

return M
