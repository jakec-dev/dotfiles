set nocompatible
set hidden
 
syntax on
 
let mapleader = ","
 
set number relativenumber
hi LineNr ctermfg=DarkGrey
 
" set list listchars=tab:>-,trail:~,extends:>,precedes:<
 
filetype plugin indent on
 
set mouse=a
set showcmd
set statusline+=%F
set laststatus=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
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
set smartcase
set nofoldenable
set foldmethod=syntax
set title
set termguicolors
set clipboard=unnamedplus
set confirm
vmap <C-c> "+y
 
nnoremap j gj
nnoremap k gk
nnoremap <LeftMouse> ma<LeftMouse>`a
" Rename tmux window to file name
nnoremap <leader>tr :echo system('tmux rename-window ' . shellescape(expand('%:t')))<CR>
 
call plug#begin()
  Plug 'fatih/vim-go'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'charlespascoe/vim-go-syntax'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'rebelot/kanagawa.nvim', { 'as': 'kanagawa' }
call plug#end()
 
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
 
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
 
" run go imports on file save
let g:go_fmt_command = "goimports"
 
" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
 
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
 
lua << EOF
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
 
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
 
    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)
 
    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)
 
    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
 
    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)
 
    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)
 
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)
 
    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)
 
    map('n', '<leader>hd', gitsigns.diffthis)
 
    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)
 
    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)
 
    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)
 
    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}
EOF
 
colorscheme kanagawa
 
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
 
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
 
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use U to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
 
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
 
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Remove gd mapping from vim-go as coc will be using it
let g:go_def_mapping_enabled = 0
 
" fzf config
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
 
" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))
 
" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))
 
nmap <leader>f :Files<cr>
nmap <leader>F :AllFiles<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>
nmap <leader>r :Rg<cr>
nmap <leader>R :Rg<space>
nmap <leader>gb :GBranches<cr>
 
" nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>