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
set number 

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

set nofoldenable
set foldmethod=syntax
let g:markdown_folding = 1
let g:vimwiki_folding = 'syntax'

vmap <C-c> "+y

nnoremap <space> za
nnoremap j gj
nnoremap k gk

call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
call plug#end()

let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'auto_toc': 1}]
let g:vimwiki_global_ext = 0
let g:vimwiki_toc_header_level = 2
let g:taskwiki_taskrc_location = '~/.config/task/taskrc'
let g:taskwiki_data_location = '~/Documents/.task'
let g:taskwiki_sort_order = 'status+,urgency-,priority-,end+,due+,project+'
