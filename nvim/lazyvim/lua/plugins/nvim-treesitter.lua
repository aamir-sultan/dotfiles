-- Function to display a message in the status line
-- local function display_status_message(message, hl_group)
--   vim.api.nvim_echo({ { message, hl_group } }, true, {})
-- end
--
return {
  --   -- add more treesitter parsers
  --   {
  --     "nvim-treesitter/nvim-treesitter",
  --     lazy = true,
  --     event = "LazyFile",
  --     opts = {
  --       ensure_installed = {
  --         -- "bash",
  --         "json",
  --         "lua",
  --         -- "markdown",
  --         -- "markdown_inline",
  --         "python",
  --         "regex",
  --         "verilog",
  --         -- "vim",
  --       },
  --       highlight = {
  --         enabled = true,
  --         -- disable = function()
  --         --   local Util = require("lazylite.util")
  --         --   -- display_status_message("Large file: Disabling Tree sitter", "WarningMsg")
  --         --   -- Util.info("Disabling Tree sitter due to Large file size", { title = "Warning" })
  --         --   return vim.b.large_buf
  --         -- end
  --       },
  --     },
  --   },

  -- Show context of the current function
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = true,
  --   event = "LazyFile",
  --   -- enabled = true,
  --   -- opts = { mode = "cursor", max_lines = 3 },
  --   cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  -- },
}
