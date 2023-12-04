" Vim Settings
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

" Remove wait on the first key of escape sequence like jk
" Plug 'nvim-zh/better-escape.vim' " Does not work on VIM 7


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