-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Lines which load the legacy setting for the vim from old vimrc
vim.cmd([[
source ~/.vimrc
]])

local opt = vim.opt

opt.winbar = "%=%m %f"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = true

vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd("cd %:p:h")
-- vim.cmd("cd %:p")
-- vim.o.autochdir = true

-- Check if any arguments were passed to Neovim
if #vim.fn.argv() > 0 then
  -- A file was passed as an argument
  vim.cmd('execute "cd " .. fnameescape(expand("%:p:h"))')
else
  -- No file was passed, use the current file's directory
  vim.cmd('execute "cd " .. fnameescape(expand("%:p"))')
end
