---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'gruvbox',
  transparency = true,
  statusline = {
    -- theme = "vscode_colored"
    -- theme = "vscode"
    -- theme = "minimal"
    theme = "default"
  }
}
 M.plugins = 'custom.plugins'
 M.mappings = require "custom.mappings"
 return M
