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
" Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-sensible'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
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

Plug 'tmux-plugins/vim-tmux' " Plugin for .tmux.conf file syntax
" Plug 'djoshea/vim-autoread'
Plug 'lambdalisue/nerdfont.vim'
Plug 'ervandew/supertab', { 'dir': '~/.vim/pack/plugins/start/supertab' }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" For Buffer management
Plug 'ctrlpvim/ctrlp.vim'

" Remove wait on the first key of escape sequence like jk
" Plug 'nvim-zh/better-escape.vim' " Does not work on VIM 7

" Language specific plugins.
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'WeiChungWu/vim-SystemVerilog', { 'for': 'systemverilog' }
Plug 'nachumk/systemverilog.vim', { 'for': 'systemverilog' }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
