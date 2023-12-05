" Get off my lawn --  disable the arrow keys in vim
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Keymapping for the comment and uncomment
" Set the leader+forwardSlash to comment -- C-m is just another way of saying carriage return
" https://stackoverflow.com/a/2630579/16941779
nnoremap <leader>/ <C-o>:call NERDComment(0,"toggle")<C-m>

" better-escape.vim Settings
" non-ASCII shortcuts are also supported for non-English keyboard.
" let g:better_escape_shortcut = ['jk', 'jj', 'kj', 'лл']
" Press Shift-Space (may not work on your system).
" :imap <S-Space> <Esc>
" Try the following so Shift-Space also enters insert mode.
" :nmap <S-Space> i " Currenly space is being used as leader key
" Or just Space to enter insert mode.
" :nmap <Space> i " Currenly space is being used as leader key
let g:better_escape_shortcut = ['jj', 'ii', 'jf']
" set time interval to 200 ms
let g:better_escape_interval = 200

" vnoremap ii :norm<esc><CR>
" cnoremap ii <C-c>
vnoremap ii <C-c>
" cnoremap jj <C-c>
" vnoremap jj <C-c>
" Keymap for leaving insert mode to normal
" This is being controlled by better-escape.vim plugin now
" inoremap jk <esc>
" inoremap kj <esc>
" inoremap jf <esc>
" inoremap jf <esc><esc>

" Toggle line numbering leader+n
nnoremap <leader>n :set nornu! nonu!<CR>
nnoremap <leader>cbg :let &bg=(&bg=='light'?'dark':'light')<cr>
" Remove the highlight from searched item
nnoremap <leader>h :set nohlsearch!<CR>

" Mapping for Easymotion
" Remaping the leader key for easymotion
" map <Leader> <Plug>(easymotion-prefix)
" map s <Plug>(easymotion-s)
" Jumping to a specific Word
" nnoremap <Leader>f <Plug>(easymotion-s)
nnoremap <leader><leader> <Plug>(easymotion-s)

" Shortcuts for tab select -- alternatives are gt and gT by default for tab switching.
nnoremap <C-S-Left> :tabprevious<CR>                                                                            
nnoremap <C-S-Right> :tabnext<CR>
" nnoremap <C-S-h> :tabprevious<CR> " Ctrl and Ctrl+Shift and not differentiated by VIM and Ctrl+h has conflicts with window switching                                                                            
" nnoremap <C-S-l> :tabnext<CR>

" Go to next buffer or previous -- Other shortcuts like Ctrl+Alt+Shift have conflicts. Be carefull and check.
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

" View scrolling for the buffer
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Search and view in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Close the current buffer not the tab or window.
" Normal Buffer close
nnoremap <leader>k :bd<cr>
" Forced Buffer close
" nnoremap <leader><leader>k :bd!<cr>
nnoremap <leader>kk :bd!<cr>

" Vim Closing shortcuts
" ZQ is same is :q!
" ZZ is same is :wq but if the file is modified then write and close, otherwise just close.
" 2 times leader is supposed to be creating and enforced mode.
nnoremap <Leader>w :w<CR>
" nnoremap <Leader><Leader>w :w!<CR>
nnoremap <Leader>ww :w!<CR>

" ctrl+q for quit or same as :q+Enter
nnoremap <C-q> <esc>:q<CR>
nnoremap <Leader>q :q<CR>
" Shift+q or "Leader Leader q" for quit or same as :q!+Enter
nnoremap Q ZQ
nnoremap <Leader>qq ZQ

" ctrl+wq for write and quit or same as :wq but only write, if the file is modified.
nnoremap <C-w><C-q> <esc>ZZ
nnoremap <Leader>wq ZZ
" "Leader Leader wq" for forced write and quit
nnoremap WQ :wq!<CR>
nnoremap <Leader>wqq :wq!<CR>

" Close all windows.
nnoremap <C-q><C-a> <esc>:qall<CR>
nnoremap <Leader>qa :qall<CR>
" "Leader Leader qa" Close all windows forcefully.
nnoremap QA :qall!<CR>
nnoremap <Leader>qaa :qall!<CR>

"Write and close all windows
nnoremap <C-w><C-q><C-a> <esc>:wqall<CR>
nnoremap <Leader>wqa :wqall<CR>
""Leader Leader wqa" Write and close all windows forcefully
nnoremap WQA :wqall!<CR>
nnoremap <Leader><Leader>wqa :wqall!<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" remap the dot command in visual mode also.
vnoremap . :norm.<CR>

" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" Apply the macro to all lines in visual mode and skip the ones which do not match.
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Switch between the last two files
nnoremap <leader><leader><leader> <c-^>
