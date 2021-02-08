set nocompatible
filetype plugin on
syntax on

set noerrorbells "no error sounds
set tabstop=4 softtabstop=4 "tabing 4 spaces
set shiftwidth=4 "shift 4 spaces
set expandtab "tabs changes to spaces
set autoindent
set smartindent "better indent
set rnu "relative line number
set smartcase "searching cases will not matter until Capital letters
set noswapfile
set undodir=$HOME\vimfiles\undodir
set undofile
set incsearch "display matches as you are searching
set hlsearch "highlight searches
set scrolloff=10 "auto scroll whenever you are at x number of lines away from top bottom
set colorcolumn=80
set signcolumn=yes "column at the left of the screen for git and stuff
set showcmd
set mouse=a "allow mouse to work
set nohidden "close a tab, remove a buffer
set splitright "open the new buffer on the right
"set guifont=Courier_New:h16
set guifont=JetBrains_Mono:h16
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    Plug 'lyuts/vim-rtags'
    Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
    Plug 'mbbill/undotree'
    Plug 'https://tpope.io/vim/surround.git'
    Plug 'https://tpope.io/vim/repeat.git'
    Plug 'https://github.com/preservim/nerdtree'
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

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <leader>pv :vs<CR>
"nnoremap<silent>  <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>z :w<CR>
nnoremap <silent> <leader>Z :wq<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
inoremap jk <Esc>

"YCM
nnoremap <slient> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <slient> <leader>gf :YcmCompleter FixIt<CR>

"HTML
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

"install vim plugged
"need to mkdir $HOME\vimfiles\undodir
":w  and     :source %      and     :PlugInstall
" increase keypress speed
"Download mono as font

