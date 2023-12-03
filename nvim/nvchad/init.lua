-- Lines which load the legacy setting for the vim from old vimrc
vim.cmd([[
source ~/.vimrc
]])

local opt = vim.opt
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
-- NvChad has enabled the mouse support which interfare with copy. So following will disable it.
-- opt.mouse = ""
-- opt.mouse = v
-- opt.mouse = r
-- Use shift+alt+mouse to select text and use it.

-- local function close_buffer_and_nvimtree(cmd)
--   vim.cmd("NvimTreeClose")
--   vim.api.nvim_command(cmd)
--   vim.cmd("NvimTreeClose")
-- end

-- nvim-tree is also there in modified buffers so this function filter it out
-- local modifiedBufs = function(bufs)
--   local t = 0
--   for k,v in pairs(bufs) do
--     if v.name:match("NvimTree_") == nil then
--       t = t + 1
--     end
--   end
--   return t
-- end
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and
--       vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--       modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--       vim.cmd "quit"
--     end
--   end
-- })

-- vim.api.nvim_create_autocmd("QuitPre", {
--   callback = function()
--     local invalid_win = {}
--     local wins = vim.api.nvim_list_wins()
--     for _, w in ipairs(wins) do
--       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
--       if bufname:match("NvimTree_") ~= nil then
--         table.insert(invalid_win, w)
--       end
--     end
--     if #invalid_win == #wins - 1 then
--       -- Should quit, so we close all invalid windows.
--       for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
--     end
--   end
-- })

-- -- nvim-tree is also there in modified buffers so this function filter it out
-- local modifiedBufs = function(bufs)
--   local t = 0
--   for k,v in pairs(bufs) do
--     if v.name:match("NvimTree_") == nil then
--       t = t + 1
--     end
--   end
--   return t
-- end
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and
--       vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--       modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--       vim.cmd "quit"
--     end
--   end
-- })

-- local function tab_win_closed(winnr)
--   local api = require"nvim-tree.api"
--   local tabnr = vim.api.nvim_win_get_tabpage(winnr)
--   local bufnr = vim.api.nvim_win_get_buf(winnr)
--   local buf_info = vim.fn.getbufinfo(bufnr)[1]
--   local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
--   local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
--   if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
--     -- Close all nvim tree on :q
--     if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
--       api.tree.close()
--     end
--   else                                                      -- else closed buffer was normal buffer
--     if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
--       local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
--       if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
--         vim.schedule(function ()
--           if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
--             vim.cmd "quit"                                        -- then close all of vim
--           else                                                  -- else there are more tabs open
--             vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
--           end
--         end)
--       end
--     end
--   end
-- end
-- 
-- vim.api.nvim_create_autocmd("WinClosed", {
--   callback = function ()
--     local winnr = tonumber(vim.fn.expand("<amatch>"))
--     vim.schedule_wrap(tab_win_closed(winnr))
--   end,
--   nested = true
-- })

-- local function close_buffer_and_nvimtree(buffer_cmd, last_window_cmd)
--   local tree = require("nvim-tree.api").tree
--   local buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)')
--   local command = buffer_count > 1 and buffer_cmd or last_window_cmd
-- 
--   tree.toggle({ focus = false })
-- 
--   local success, errorMsg = pcall(api.nvim_command, command)
--   if not success then
--     print("Failed to quit: " .. errorMsg)
--   end
-- 
--   tree.toggle({ focus = false })
-- 
--   if buffer_count == 1 and #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--     vim.cmd("quit")
--   end
-- end
-- 
-- map("n", "<Leader>q", function()
--   close_buffer_and_nvimtree("bd", "q")
-- end, { noremap = true, silent = true })
-- map("n", "<Leader>x", function()
--   close_buffer_and_nvimtree("bd!", "q!")
-- end, { noremap = true, silent = true })
