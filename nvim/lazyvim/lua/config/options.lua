-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Lines which load the legacy setting for the vim from old vimrc
vim.cmd([[
source ~/.vimrc
]])

-- vim.cmd([[
-- if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif
-- ]])

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
-- Auto change the work directory to the file parent directory
-- vim.o.autochdir = true
