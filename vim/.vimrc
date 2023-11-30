
"  _  _  __  _  _    ____  ____  ____  ____  __  __ _   ___  ____
" / )( \(  )( \/ )  / ___)(  __)(_  _)(_  _)(  )(  ( \ / __)/ ___)
" \ \/ / )( / \/ \  \___ \ ) _)   )(    )(   )( /    /( (_ \\___ \
"  \__/ (__)\_)(_/  (____/(____) (__)  (__) (__)\_)__) \___/(____/

" Settings only applicable to VIM
" =====================================================================================
if !has("nvim")
  " ------------------------------------------------------------------------------------- 
  " Plugins installation with vim-plug
  call plug#begin('~/.vim/dotplugged')
  " The default plugin directory will be as follows:
  "   - Vim (Linux/macOS): '~/.vim/plugged'
  "   - Vim (Windows): '~/vimfiles/plugged'
  "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  " You can specify a custom plugin directory by passing it as the argument
  "   - e.g. `call plug#begin('~/.vim/plugged')`
  "   - Avoid using standard Vim directory names like 'plugin'

  " Plug 'arcticicestudio/nord-vim'

  Plug 'ghifarit53/tokyonight-vim'

  " Start screen for Vim and Neovim.
  Plug 'mhinz/vim-startify'

  " Insert or delete brackets, parens, quotes in pair.
  Plug 'jiangmiao/auto-pairs'

  " Rooter changes the working directory to the project root when you open a file or directory.
  Plug 'airblade/vim-rooter'

  Plug 'noahfrederick/vim-noctu'
  Plug 'frazrepo/vim-rainbow'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-sensible'
  " Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'AxolotlC/Fox.vim'
  Plug 'jdkanani/vim-material-theme'

  " Nerdtree + Git plugin (shows git status in nerdtree)
  Plug 'preservim/nerdtree',
  " Plug 'xuyuanp/nerdtree-git-plugin' " Creating issue in VIM 7.0

  Plug 'morhetz/gruvbox'
  " Plug 'jnurmine/Zenburn'
  Plug 'airblade/vim-gitgutter'
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'rust-lang/rust.vim', { 'for': 'rust' }

  Plug 'WeiChungWu/vim-SystemVerilog', { 'for': 'systemverilog' }
  Plug 'nachumk/systemverilog.vim', { 'for': 'systemverilog' }

  Plug 'tmux-plugins/vim-tmux'
  " Plug 'djoshea/vim-autoread'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'ervandew/supertab', { 'dir': '~/.vim/pack/plugins/start/supertab' }
  Plug 'easymotion/vim-easymotion'
  Plug 'christoomey/vim-tmux-navigator'

  " For Buffer management
  Plug 'ctrlpvim/ctrlp.vim'
  " Initialize plugin system
  " - Automatically executes `filetype plugin indent on` and `syntax enable`.
  call plug#end()

  " execute pathogen#infect()
  "filetype plugin indent on
  " colorscheme darkblue
  " colorscheme koehler
  " colorscheme nord
  " colorscheme noctu

  " leader key mapping 
  " let mapleader=","
  let mapleader = "\<Space>"

  " Supported in 8.0 or above
  " set termguicolors

  " Gruvbox related settings
  set bg=dark

  " let g:gruvbox_contrast_dark = 'medium'
  " let g:gruvbox_transparent_bg = '1'
  " " let g:gruvbox_italic = '1'
  " silent! colorscheme gruvbox " Silent is used so that it does not throw errors when the gruuvbox is not available

  " tokyonight-vim settings
  " let g:tokyonight_style = 'night' " available: night, storm
  let g:tokyonight_style = 'storm' " available: night, storm
  let g:tokyonight_enable_italic = 1
  let g:tokyonight_transparent_background = 1
  " 'auto', 'red', 'green', 'blue'
  let g:tokyonight_cursor = 'auto'
  silent! colorscheme tokyonight

  " Nerdtree Settings
  let NERDTreeShowHidden=1

  " Start NERDTree when Vim starts with a directory argument.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | NERDTreeFocus | endif

  " " New Settings for starting Vim with NERDTree
  "  autocmd StdinReadPre * let s:std_in=1
  "  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | 
  "        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | NERDTree |
  "              \ elseif argc() > 0 || exists("s:std_in") | wincmd p |
  "              \ elseif argc() == 0 && !exists('s:std_in') | NERDTree | endif 

" \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | execute 'NERDTree' argv()[0] |
" Old Setting for starting vim with NERDTree
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Setting the shortcut for Nerdtree and others 
noremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" in NERDTree, to open-silently file in newtab with Enter, instead of default pressing "T" (same for not silently with Tab instead of t). To restore the comment the following two lines.
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenInTabSilent='<S-t>'

" Position the nerdtree on the right side of the vim window.
let g:NERDTreeWinPos = "right"

" nerdtree-git-plugin settings
" you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

"airline and airline theme settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
"Futher available list of the themes can be seen from https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themes
"  let g:airline_theme='cool'
"  let g:airline_theme='deus'
let g:airline_theme='night_owl'
"  let g:airline_theme='onedark'
"  let g:airline_theme='papercolor'
"  let g:airline_theme='raven'
"let g:airline_theme='simple'
"  let g:airline_theme='soda'
"let g:airline_theme='solarized'
"let g:airline_theme='zenburn'
"  let g:airline_theme='understand'
"  Only available when tokyonight theme is installed
"  let g:airline_theme = 'tokyonight'

"GitGutter Settings
" This will set the sign column to true by default. Set it no if the column
" is not required
" set signcolumn=yes
"It will set the signcolumn color to clear so default colour of the theme
"will be shown
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_map_keys = 0
" ------------------------------------------------------------------------------------- 
endif " End of the Only VIM Related Settings
" =====================================================================================


"  __ _  ____  __   _  _  __  _  _    ____  ____  ____  ____  __  __ _   ___  ____
" (  ( \(  __)/  \ / )( \(  )( \/ )  / ___)(  __)(_  _)(_  _)(  )(  ( \ / __)/ ___)
" /    / ) _)(  O )\ \/ / )( / \/ \  \___ \ ) _)   )(    )(   )( /    /( (_ \\___ \
" \_)__)(____)\__/  \__/ (__)\_)(_/  (____/(____) (__)  (__) (__)\_)__) \___/(____/


" Setting only applicable to NVIM
" =====================================================================================
if has("nvim")
  " ------------------------------------------------------------------------------------- 
  " New Settings for starting Nvim in the directory passed or cuurent pwd dir.
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | 
  " \ execute 'cd '.argv()[0] | wincmd p | enew |
  " \ elseif argc() > 0 || exists("s:std_in") |
  " \ elseif argc() == 0 && !exists('s:std_in') | endif 

" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"     \ execute 'cd '.argv()[0] | endif 

" if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif

function g:CloseBufOrWin() abort
  let l:bufs = nvim_list_bufs()
  let l:activebufs = []
  for l:buf in bufs
    if nvim_buf_is_loaded(l:buf) && nvim_buf_is_valid(l:buf)
      call add(l:activebufs, l:buf)
    endif
  endfor

  " if len(l:activebufs) > 1
  if len(getbufinfo({'buflisted':1})) > 1
    execute 'bd'
  else
    execute 'q'
  endif
endfunction

nnoremap <Leader>q <Cmd>call CloseBufOrWin()<CR>
" ------------------------------------------------------------------------------------- 
endif
" =====================================================================================

"   ___  __   _  _  _  _   __   __ _    ____  ____  ____  ____  __  __ _   ___  ____
"  / __)/  \ ( \/ )( \/ ) /  \ (  ( \  / ___)(  __)(_  _)(_  _)(  )(  ( \ / __)/ ___)
" ( (__(  O )/ \/ \/ \/ \(  O )/    /  \___ \ ) _)   )(    )(   )( /    /( (_ \\___ \
"  \___)\__/ \_)(_/\_)(_/ \__/ \_)__)  (____/(____) (__)  (__) (__)\_)__) \___/(____/
"
" Setting only applicable to both VIM/NVIM
" =====================================================================================
" Turn on syntax highlighting
syntax on

" set encoding=utf-8

" Setting up the FZF settings
" This shortcut ctrl+f has a conflict with NERDTreeToggle find. 
set rtp+=~/.vim/bundle/fzf
nnoremap <leader>fa :Files<CR>

" Settings for the Nerd Commenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Keymapping for the comment and uncomment
" Set the leader+forwardSlash to comment -- C-m is just another way of saying carriage return
" https://stackoverflow.com/a/2630579/16941779
inoremap <leader>/ <C-o>:call NERDComment(0,"toggle")<C-m>

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

filetype plugin indent on
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
set timeoutlen=600

" To deactivate that pre-historic freezing feature.
silent !stty -ixon

set number
" Toggle line numbering leader+n
nnoremap <leader>n :set nornu! nonu!<CR>

" Add relative numbering in normal mode and line numbering in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"Sets the last typed command to appear in the last line of the VIM terminal
set showcmd

" Split to the right and split to down -- which feels more natural
set splitbelow splitright

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <leader>cbg :let &bg=(&bg=='light'?'dark':'light')<cr>

" Remove the highlight from searched item
set hlsearch
nnoremap <leader>h :set nohlsearch!<CR>

" Keymap for leaving insert mode to normal
" inoremap jk <esc>
" inoremap kj <esc>
" inoremap jf <esc>
inoremap jf <esc><esc>

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

" function! QuitIfUnnamed()
"   if bufname('%') == ''
"       execute 'q!'
"   else
"       execute 'q'
"   endif
" endfunction

" cnoreabbrev <expr> q QuitIfUnnamed()

" Close the current buffer not the tab or window.
" Normal Buffer close
nnoremap <leader>k :bd<cr>
" Forced Buffer close
nnoremap <leader><leader>k :bd!<cr>

" Vim Closing shortcuts
" ZQ is same is :q!
" ZZ is same is :wq but if the file is modified then write and close, otherwise just close.
" 2 times leader is supposed to be creating and enforced mode.
nnoremap <Leader>w :w<CR>
nnoremap <Leader><Leader>w :w!<CR>

" ctrl+q for quit or same as :q+Enter
nnoremap <C-q> <esc>:q<CR>
nnoremap <Leader>q :q<CR>
" Shift+q or "Leader Leader q" for quit or same as :q!+Enter
nnoremap Q ZQ
nnoremap <Leader><Leader>q ZQ

" ctrl+wq for write and quit or same as :wq but only write, if the file is modified.
nnoremap <C-w><C-q> <esc>ZZ
nnoremap <Leader>wq ZZ
" "Leader Leader wq" for forced write and quit
nnoremap WQ :wq!<CR>
nnoremap <Leader><Leader>wq :wq!<CR>

" Close all windows.
nnoremap <C-q><C-a> <esc>:qall<CR>
nnoremap <Leader>qa :qall<CR>
" "Leader Leader qa" Close all windows forcefully.
nnoremap QA :qall!<CR>
nnoremap <Leader><Leader>qa :qall!<CR>

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

" To set the buffer write when there is a buffer jump from one to another.
set hidden

" remap the dot command in visual mode also.
vnoremap . :norm.<CR>

set colorcolumn=110

" ignorecase and smartcase together make Vim deal with case-sensitive search intelligently. If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive. Most of the time this does what you want.
set ignorecase
set smartcase

" buffer screen updates instead of updating all the time (speeds up scrolling)
set lazyredraw

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


" I can't remember a time when I didn't want to save a file after tabbing away from my editor (especially with version control and Vim's persistent undo):
au FocusLost * :wa

" No swapfile since we have unlimited undo file now
set noswapfile

" Switch between the last two files
nnoremap <leader><leader><leader> <c-^>

" Get off my lawn --  disable the arrow keys in vim
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Local config -- For addtional settings.
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
" =====================================================================================
