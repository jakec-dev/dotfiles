set nocompatible
syntax on
let mapleader = ","

set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//

hi LineNr ctermfg=DarkGrey

filetype plugin on
filetype indent on

set mouse=a

set showcmd
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

let g:vimwiki_list = [{'path': '~/Documents/Sync/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:taskwiki_taskrc_location = '~/.config/task/taskrc'
let g:taskwiki_data_location = '~/Documents/.task'
