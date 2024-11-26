-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyLite/LazyLite/blob/main/lua/lazylite/config/autocmds.lua
-- Add any additional autocmds here
local General = require('general')
local vim = vim or {}
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup('GENERAL_LUA', {})

-- When editing a file, always jump to the last known cursor position.
-- Don't do it for commit messages, when the position is invalid, or when
-- inside an event handler (happens when dropping a file on gvim).
-- In addition open folds till the cursor is visible
autocmd('BufReadPost', {
  callback = function()
    local line = vim.fn.line

    if vim.bo.filetype == 'gitcommit' then return end
    if line("'\"") <= 0 then return end
    if line("'\"") > line('$') then return end

    vim.cmd("normal g`\"")
    vim.cmd('normal zv')
  end,
  group = general
})

-- Disable linting and syntax highlighting for large files
-- autocmd('BufReadPre', {
--   callback = function()
--     if vim.fn.getfsize(vim.fn.expand('%')) > 10000000 then
--       vim.cmd('syntax off')
--       vim.g.ale_enabled = 0
--       vim.g.coc_enabled = 0
--     end
--   end,
--   group = general
-- })

-- http://vim.wikia.com/wiki/Speed_up_Syntax_Highlighting
autocmd('syntax', {
  callback = function()
    local line = vim.fn.line

    if 2000 < line('$') then
      vim.cmd('syntax sync maxlines=200')
    end
  end,
  group = general
})

-- Set syntax highlighting for Apraisals
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Appraisals',
  callback = function() vim.bo.filetype = 'ruby' end,
  group = general
})

-- Automatically remove fugitive buffers
autocmd('BufReadPost', {
  pattern = 'fugitive://*',
  callback = function() vim.bo.bufhidden = 'delete' end,
  group = general
})

-- Automatically remove trailing whitespaces unless file is blacklisted
-- autocmd('BufWritePre', {
--   callback = function()
--     General.Preserve(function() vim.cmd("%s/\\s\\+$//e") end)
--   end,
--   group = general
-- })

-- Ensure directory structure exists when opening a new file
-- autocmd('BufNewFile', {
--   callback = function() General.EnsureDirExists() end,
--   group = general
-- })

-- NOTE: open quickfix window after vim grep
-- ref: https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
local qf_group = augroup('ALEXANDER_QF', {})
autocmd('QuickFixCmdPost', {
  pattern = '[^l]*',
  command = 'cwindow',
  group = qf_group
})

autocmd('QuickFixCmdPost', {
  pattern = 'l*',
  command = 'lwindow',
  group = qf_group
})

-- Function to check if the current file has more than 30000 lines
local function is_large_file()
  -- local current_buf_lines = vim.api.nvim_buf_line_count(0)
  -- Check if buffer exists otherwise but defualt set the file size to to small
  if vim.fn.expand('%') == '' then
    return false
  else
    local current_buf_lines = tonumber(vim.fn.system({ 'wc', '-l', vim.fn.expand('%') }):match('%d+'))
    return current_buf_lines > DISABLE_ON_LINES
  end
end

vim.g.DISABLE_ON_LINES = 20000
autocmd({ 'BufRead', 'BufReadPost' }, {
  -- autocmd({'BufRead'}, {
  callback = function()
    -- if is_large_file() then
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > vim.g.DISABLE_ON_LINES) then
      -- if vim.fn.exists(':TSBufDisable') > 0 then
      --   vim.cmd("TSDisable all")
      -- end

      if vim.fn.exists(':TSContextDisable') > 0 then
        vim.cmd("TSContextDisable")
      end

      -- Disable the flash search for large files.
      require("flash").toggle(false)
    end
  end,
  group = general,
  pattern = "*",
})

autocmd({ "BufReadPre" }, {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > vim.g.DISABLE_ON_LINES) then
      vim.b.large_buf = true
    else
      vim.b.large_buf = false
    end
  end,
  group = general,
  pattern = "*",
})

local function changeDirectoryOnce()
  if not vim.g.directory_changed then
    if #vim.fn.argv() > 0 then
      vim.cmd('execute "cd " .. vim.fn.fnameescape(vim.fn.expand("%:p:h"))')
    else
      vim.cmd('execute "cd " .. vim.fn.fnameescape(vim.fn.expand("%:p"))')
    end
    vim.g.directory_changed = true
  end
end

-- Define an autocommand to call the function when VimEnter event is triggered
-- autocmd({ "BufRead" }, {
--   callback = function()
--     ChangeDirectoryOnce()
--   end,
--   group = general,
--   pattern = "*",
-- })


-- local group = vim.api.nvim_create_augroup("LargeFileAutocmds", {})
-- local old_eventignore = vim.o.eventignore;
-- local largefile_opened = false;


-- autocmd({"BufReadPre"}, {
-- 	group = group,
-- 	callback = function(ev)
-- 		if ev.file then
-- 			local status, size = pcall(function() return vim.loop.fs_stat(ev.file).size end)
-- 			if status and size > 1024 * 1024 then -- large file
-- 				vim.wo.wrap = false
-- 				old_eventignore = vim.o.eventignore
-- 				largefile_opened = true
-- 				vim.o.eventignore = 'FileType'
-- 				vim.bo.swapfile = false
-- 				vim.bo.bufhidden = 'unload'
-- 				vim.bo.buftype = 'nowrite'
-- 				vim.bo.undolevels = -1
-- 			end
-- 		end
-- 	end
-- })

-- autocmd({"BufWinEnter"}, {
-- 	group = group,
-- 	callback = function(ev)
-- 		if largefile_opened then
-- 			largefile_opened = false
-- 			vim.o.eventignore = nil
-- 		end
-- 	end
-- })


-- autocmd({"BufEnter"}, {
-- 	group = group,
-- 	callback = function(ev)
-- 		local byte_size = vim.api.nvim_buf_get_offset(ev.buf, vim.api.nvim_buf_line_count(ev.buf))
-- 		if byte_size > 1024 * 1024 then
-- 			if vim.g.loaded_matchparen then
-- 				vim.cmd('NoMatchParen')
-- 			end
-- 		else
-- 			if not vim.g.loaded_matchparen then
-- 				vim.cmd('DoMatchParen')
-- 			end
-- 		end
-- 	end
-- })
