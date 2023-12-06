-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
--
-- -- terminal
-- map("t", "<C-h>", "<cmd>wincmd h<CR>")
-- map("t", "<C-j>", "<cmd>wincmd j<CR>")
-- map("t", "<C-k>", "<cmd>wincmd k<CR>")
-- map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N', {desc = "Create new line below this line"} )

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>', {desc = "Create new line below this line"})
map('n', '<leader>O', 'O<ESC>', {desc = "Create new line below this line"})

-- Mimic shell movements
map('i', '<C-E>', '<C-o>$', {desc = "Jump to line End -- Mimic shell movement"})
map('i', '<C-A>', '<C-o>^', {desc = "Jump to line Start -- Mimic shell movement"})

-- Shortcut to yank register
map({ 'n', 'x' }, '<leader>p', '"0p', {desc = "Paste from yank register"})

