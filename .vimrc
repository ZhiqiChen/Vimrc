set nocompatible
filetype plugin on
syntax on

set noerrorbells                       "no error sounds
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab "tabing and shifting 4 spaces,
set autoindent
set smartindent                        "better indent
set rnu                                "relative line number
set nu                                 "set line number
set ignorecase
set smartcase                          "searching cases will not matter until Capital letters
set incsearch                          "display matches as you are searching
set hlsearch                           "highlight searches
set noswapfile
set undodir=~/.vim/undodir
set undofile
set scrolloff=8                        "auto scroll whenever you are at x number of lines away from top bottom
set colorcolumn=80
set signcolumn=yes "column at the left of the screen for git and stuff
set showcmd
set mouse=a                            "allow mouse to work
set nohidden                           "close a tab, remove a buffer
set splitright                         "open the new buffer on the right
"set guifont=Courier_New:h16
set guifont=JetBrains_Mono:h15
"2 settings to enable ligatures
set renderoptions=type:directx
set encoding=utf-8
highlight ColorColumn ctermbg=0 guibg=lightgrey
" set the backspace to delete normally
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
    "visual / background functional
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'leafgarland/typescript-vim'
    "grep
    Plug 'vim-utils/vim-man'
    Plug 'jremmen/vim-ripgrep'
    "Visual studio type stuff or better experience
    Plug 'lyuts/vim-rtags' "find references
    Plug 'mbbill/undotree'
    Plug 'https://github.com/preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    Plug 'preservim/nerdcommenter'
    Plug 'https://github.com/ctrlpvim/ctrlp.vim.git' "fuzzy finder
    "git
    Plug 'https://github.com/airblade/vim-gitgutter.git'
    Plug 'tpope/vim-fugitive'

    "functionalities
    Plug 'https://tpope.io/vim/surround.git' |
        \ Plug 'https://tpope.io/vim/repeat.git'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mattn/emmet-vim' "html shortcuts
    Plug 'https://tpope.io/vim/unimpaired.git' "some interesting commands

    Plug 'https://github.com/ycm-core/YouCompleteMe.git'
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <leader>vs :vs<CR>
"nnoremap<silent>  <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>z :w<CR>
nnoremap <silent> <leader>Z :wq<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"YCM
nnoremap <slient> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <slient> <leader>gf :YcmCompleter FixIt<CR>

"HTML
nnoremap <leader>a i<++><Esc>F<
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;p <p></p><Space><++><Esc>FpT>i

"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>"
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" Auto delete all trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

"git gutter
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
set updatetime=500

"Nerd Commenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

"Emmet
"just for html,css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"install vim plugged
"need to mkdir ~/.vim/undodir"
":w  and     :source %      and     :PlugInstall
"install youcompleteme
"increase keypress speed
"Download mono as font
