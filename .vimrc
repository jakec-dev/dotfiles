syntax on
let mapleader = ","

set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//

hi LineNr ctermfg=DarkGrey

filetype plugin on
filetype indent on

set showcmd
set nocompatible
set statusline=
set laststatus=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number relativenumber

set ai
set si
set wrap
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set lazyredraw
set showmatch
set mat=2
set incsearch
set hlsearch
set ignorecase
set foldenable
set foldlevelstart=10
set foldmethod=indent

vmap <C-c> "+y

nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap <F3> :r! date "+\%A, \%d \%B \%Y"<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeIgnore = ['^node_modules$']

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
