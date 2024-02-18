
-- Function to display a message in the status line
local function display_status_message(message, hl_group)
  vim.api.nvim_echo({{message, hl_group}}, true, {})
end

return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = function()
    --   display_status_message("Tree Sitter 3 -- Large file: Disabling some extentions due to large file size", "WarningMsg")
    --   return vim.b.large_buf 
    -- end,
    opts = {
      ensure_installed = {
        -- "bash",
        "json",
        "lua",
        -- "markdown",
        -- "markdown_inline",
        "python",
        "regex",
        "verilog",
        -- "vim",
      },
      highlight = {
        enabled = true,
        disable = function()
          display_status_message("Large file: Disabling Tree sitter", "WarningMsg")
          return vim.b.large_buf 
        end
      },
    },
  },

  -- Show context of the current function
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      {
        "<leader>ut",
        function()
          local Util = require("lazyvim.util")
          local tsc = require("treesitter-context")
          tsc.toggle()
          if Util.inject.get_upvalue(tsc.toggle, "enabled") then
            Util.info("Enabled Treesitter Context", { title = "Option" })
          else
            Util.warn("Disabled Treesitter Context", { title = "Option" })
          end
        end,
        desc = "Toggle Treesitter Context",
      },
    },
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    -- enabled = function()
    --   display_status_message("Tree Sitter Auto Tag  -- Large file: Disabling some extentions due to large file size", "WarningMsg")
    --   return vim.b.large_buf 
    -- end,
    opts = {},
  },
}
