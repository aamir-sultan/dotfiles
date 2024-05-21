" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Add relative numbering in normal mode and line numbering in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" I can't remember a time when I didn't want to save a file after tabbing away from my editor (especially with version control and Vim's persistent undo):
au FocusLost * :wa

" Add file types and comment string for the files here.
" Set the filetype to SystemVerilog for files with .sv or .svh extension
autocmd BufNewFile,BufRead *.sv,*.svh set filetype=systemverilog
" Set commentstring based on filetype
autocmd FileType systemverilog setlocal commentstring=//\ %s
" Add more file types and commentstrings in similar way
