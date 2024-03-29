-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local Del = vim.keymap.del

function del_key(lhs, rhs, opts)
  local default_keys = require("lazyvim.config.keymaps").get()
  default_keys[#keys + 1] = { lhs, false }
end

-- Map("n", "<C-h>", "<C-w>h")
-- Map("n", "<C-j>", "<C-w>j")
-- Map("n", "<C-k>", "<C-w>k")
-- Map("n", "<C-l>", "<C-w>l")
--
-- -- terminal
-- Map("t", "<C-h>", "<cmd>wincmd h<CR>")
-- Map("t", "<C-j>", "<cmd>wincmd j<CR>")
-- Map("t", "<C-k>", "<cmd>wincmd k<CR>")
-- Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Map("v", "J", ":m '>+1<CR>gv=gv")
-- Map("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
-- Toggle Transparency
Map("n", "<F7>", "<ESC><cmd>TransparentToggle<CR>", { desc = "Toggle Transparency" })

-- Fix * (Keep the cursor position, don't move to next match)
Map('v', 'ii', '<C-c>', { desc = "Exits to normal mode from visual" })
-- vim.keymap.set("v", "ii", "<C-c>")

-- Fix * (Keep the cursor position, don't move to next match)
Map('n', '*', '*N', { desc = "Create new line below this line" })

-- leader-o/O inserts blank line below/above
Map('n', '<leader>o', 'o<ESC>', { desc = "Create new line below this line" })
Map('n', '<leader>O', 'O<ESC>', { desc = "Create new line below this line" })

-- Mimic shell movements
Map('i', '<C-E>', '<C-o>$', { desc = "Jump to line End -- Mimic shell movement" })
Map('i', '<C-A>', '<C-o>^', { desc = "Jump to line Start -- Mimic shell movement" })

-- Shortcut to yank register
Map({ 'n', 'x' }, '<leader>p', '"0p', { desc = "Paste from yank register" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
Map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- *************************************************-
-- Default Disables
-- *************************************************-
-- Disabled keys -- Ctrl + hjkl are disabled for original LazyVim Config instead the following will be used.
-- Move to window using the <ctrl> hjkl keys
Map("n", "<C-h>", ":<C-U>TmuxNavigateLeft<cr>", { desc = "Go to left window either tmux or nvim" })
Map("n", "<C-j>", ":<C-U>TmuxNavigateDown<cr>", { desc = "Go to lower window either tmux or nvim" })
Map("n", "<C-k>", ":<C-U>TmuxNavigateUp<cr>", { desc = "Go to upper window either tmux or nvim" })
Map("n", "<C-l>", ":<C-U>TmuxNavigateRight<cr>", { desc = "Go to right window either tmux or nvim" })


Map("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save Current Buffer" })
Map("n", "<leader>wo", "<C-W>p", { desc = "Other window" })
Map("n", "--", "<C-^>", { desc = "Toggle window to last active buffer" })
