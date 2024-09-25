" " Setting only applicable to both VIM/NVIM
" " =====================================================================================
" " Turn on syntax highlighting
" syntax on
"
" " set encoding=utf-8
"
" " Setting up the FZF settings
" " This shortcut ctrl+f has a conflict with NERDTreeToggle find. 
" set rtp+=~/.vim/bundle/fzf
" nnoremap <leader>fa :Files<CR>
"
" filetype plugin indent on

" " Settings for the Nerd Commenter
" " Create default mappings
" let g:NERDCreateDefaultMappings = 1
"
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1
"
" Setting for the syntastic plugin
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" nachumk/systemverilog.vim Setting to activate tokens like begin end and others.
" Enable matchit -- Although this is provided by vim-sensible also. So commented.
" runtime macros/matchit.vim 

"  To automatically indent lines    
set autoindent
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Set the backspace to work on anything when in insert mode
set backspace=indent,eol,start
" Change for key presses timeout default is 1000 or comment it for default
" set timeoutlen=1000 ttimeoutlen=0 " Creating issues in Wezterm when the vim goes to background and again to foreground. 42c command is run

" To deactivate that pre-historic freezing feature.
silent !stty -ixon

set number

"Sets the last typed command to appear in the last line of the VIM terminal
set showcmd

" Split to the right and split to down -- which feels more natural
set splitbelow splitright

" Set Text highlight on search
set hlsearch

" function! QuitIfUnnamed()
"   if bufname('%') == ''
"       execute 'q!'
"   else
"       execute 'q'
"   endif
" endfunction

" cnoreabbrev <expr> q QuitIfUnnamed()

" To set the buffer write when there is a buffer jump from one to another.
set hidden

set colorcolumn=110

" ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive. Most of the time this does what you want.
set ignorecase
set smartcase

" buffer screen updates instead of updating all the time (speeds up scrolling)
" set lazyredraw

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. These files contain undo information so you can undo previous actions even after you close and reopen a file.
set undofile
set undodir=.undo/,~/.vim/undo/,/tmp//
if !isdirectory($HOME . "/.vim/undo")
  call mkdir($HOME . "/.vim/undo", "p", 0700)
endif
" Unset the undofile to not store the undo information
" set noundofile

if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p", 0700)
endif
set backupdir=.backup/,~/.vim/backup/,/tmp//

if !isdirectory($HOME . "/.vim/swp")
  call mkdir($HOME . "/.vim/swp", "p", 0700)
endif
set directory=.swp/,~/.vim/swp/,/tmp//

" No swapfile since we have unlimited undo file now
set noswapfile

" when a word is searched and replaced with cgn then with . it moves to next word and does not change it till . pressed
source <sfile>:h/quick_replace.vim
