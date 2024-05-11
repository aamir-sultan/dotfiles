" Get off my lawn --  disable the arrow keys in vim
" nnoremap <Left> <esc>:echoe "Use h"<CR>
" nnoremap <Right> <esc>:echoe "Use l"<CR>
" nnoremap <Up> <esc>:echoe "Use k"<CR>
" nnoremap <Down> <esc>:echoe "Use j"<CR>

" " Keymapping for the comment and uncomment
" " Set the leader+forwardSlash to comment -- C-m is just another way of saying carriage return
" " https://stackoverflow.com/a/2630579/16941779
" nnoremap <leader>/ <C-o><esc>:call NERDComment(0,"toggle")<C-m>

" " better-escape.vim Settings
" " non-ASCII shortcuts are also supported for non-English keyboard.
" " let g:better_escape_shortcut = ['jk', 'jj', 'kj', 'лл']
" " Press Shift-Space (may not work on your system).
" " :imap <S-Space> <Esc>
" " Try the following so Shift-Space also enters insert mode.
" " :nmap <S-Space> i " Currenly space is being used as leader key
" " Or just Space to enter insert mode.
" " :nmap <Space> i " Currenly space is being used as leader key
" let g:better_escape_shortcut = ['jj', 'ii']
" " set time interval to 200 ms
" let g:better_escape_interval = 200
"
" " vnoremap ii <esc>:norm<esc><CR>
" " cnoremap ii <C-c>
" vnoremap ii <C-c>
" " cnoremap jj <C-c>
" " vnoremap jj <C-c>
" " Keymap for leaving insert mode to normal
" " This is being controlled by better-escape.vim plugin now
" " inoremap jk <esc>
" " inoremap kj <esc>
" " inoremap jf <esc>
" " inoremap jf <esc><esc>
" inoremap ii <esc><esc>

" Toggle line numbering leader+n
nnoremap <leader>tn <esc>:set nornu! nonu!<CR>
" Toggle background
nnoremap <F6> :let &bg=(&bg=='light'?'dark':'light')<cr>
" Remove the highlight from searched item
nnoremap <leader>th <esc>:set nohlsearch!<CR>
" Toggle line wrapping 
nnoremap <leader>tw <esc>:set wrap!<CR>

" Mapping for Easymotion
" Remaping the leader key for easymotion
" map <Leader> <Plug>(easymotion-prefix)
" map s <Plug>(easymotion-s)
" Jumping to a specific Word
" nnoremap <Leader>f <Plug>(easymotion-s)
nnoremap <leader><leader> <Plug>(easymotion-s)

" Shortcuts for tab select -- alternatives are gt and gT by default for tab switching.
nnoremap <C-S-Left> <esc>:tabprevious<CR>                                                                            
nnoremap <C-S-Right> <esc>:tabnext<CR>
" nnoremap <C-S-h> <esc>:tabprevious<CR> " Ctrl and Ctrl+Shift and not differentiated by VIM and Ctrl+h has conflicts with window switching                                                                            
" nnoremap <C-S-l> <esc>:tabnext<CR>

" Go to next buffer or previous -- Other shortcuts like Ctrl+Alt+Shift have conflicts. Be carefull and check.
nnoremap <tab> <esc>:bnext<CR>
nnoremap <S-tab> <esc>:bprev<CR>

" View scrolling for the buffer
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Ctrl+c should initiate esc in all modes as the toggling of the relative and normal numbers are not working
noremap <C-c> <esc>
noremap! <C-c> <esc>

" Search and view in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Close the current buffer not the tab or window.
" Normal Buffer close
nnoremap <leader>k <esc>:bd<cr>
" Forced Buffer close
" nnoremap <leader><leader>k <esc>:bd!<cr>
nnoremap <leader>kk <esc>:bd!<cr>

" Vim Closing shortcuts
" ZQ is same is :q!
" ZZ is same is :wq but if the file is modified then write and close, otherwise just close.
" 2 times leader is supposed to be creating and enforced mode.
nnoremap <Leader>ww <esc>:w<CR>
" nnoremap <Leader><Leader>w <esc>:w!<CR>
nnoremap <Leader>wf <esc>:w!<CR>

" ctrl+q for quit or same as <esc>:q+Enter
nnoremap <C-q> <esc>:q<CR>
nnoremap <Leader>qt <esc>:q<CR>
" Shift+q or "Leader Leader q" for quit or same as :q!+Enter
" nnoremap Q <esc>ZQ
nnoremap <Leader>qf <esc>ZQ

" ctrl+wq for write and quit or same as :wq but only write, if the file is modified.
nnoremap <C-w><C-q> <esc>ZZ
nnoremap <Leader>wqt <esc>ZZ
" "Leader Leader wq" for forced write and quit
" nnoremap WQ <esc>:wq!<CR>
nnoremap <Leader>wqf <esc>:wq!<CR>

" Close all windows.
nnoremap <C-q><C-a> <esc><esc>:qall<CR>
nnoremap <Leader>qa <esc><esc>:qall<CR>
"Aligned with LazyVim shortcuts"
nnoremap <Leader>qq <esc><esc>:qall<CR>

" "Leader Leader qa" Close all windows forcefully.
" nnoremap QA <esc>:qall!<CR>
nnoremap <Leader>qaf <esc>:qall!<CR>

"Write and close all windows
nnoremap <C-w><C-q><C-a> <esc><esc>:wqall<CR>
nnoremap <Leader>wqa <esc>:wqall<CR>
nnoremap <Leader>wqq <esc>:wqall<CR>

""Leader Leader wqa" Write and close all windows forcefully
" nnoremap WQA <esc>:wqall!<CR>
nnoremap <Leader>wqaf <esc>:wqall!<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd <esc>:Gvdiff<CR>
nnoremap gdh <esc>:diffget //2<CR>
nnoremap gdl <esc>:diffget //3<CR>

" remap the dot command in visual mode also.
vnoremap . <esc>:norm.<CR>

" https<esc>://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" Apply the macro to all lines in visual mode and skip the ones which do not match.
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Switch between the last two files
nnoremap -- <c-^>
