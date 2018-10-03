source $HOME/.vim/config/init.vimrc
source $HOME/.vim/config/deoplete.vimrc
source $HOME/.vim/config/ultisnipets.vimrc

" fix for deoplete/vim-autoclose
" https://github.com/Shougo/deoplete.nvim/issues/386
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Fix for rails/ruby performance.
" Use old REGEX engine
set re=1

" deoplete
let g:deoplete#enable_at_startup = 1

" UTF-8 All the way
scriptencoding utf-8
filetype plugin indent on
set nocompatible
syntax on
set encoding=utf8
" Enable mouse scrolling in cli
set mouse=a

set nobackup
set nowritebackup

"My favorite color scheme
set t_Co=256
colorscheme distinguished
hi Normal ctermfg=159
hi Comment ctermfg=253
hi CursorLine ctermbg=0
hi CursorColumn ctermbg=237

"toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

"markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Indentation
"set smartindent
set cindent
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

"Line Number
set number
set colorcolumn=120
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"airline
set laststatus=2

"Smarter search
set showmatch
set incsearch
set hlsearch
set ignorecase
set infercase
set smartcase
set scrolloff=5

"Smarter command line
set wildmenu
set wildmode=list,longest,full

"Smarter substitution
set gdefault

"Show current line and column
set cursorcolumn
set cursorline

"Miscellaneous options
set showcmd
set noautochdir

"Update frequently
set updatetime=1000

"Speed up autocomplete by not searching included files
set complete-=i

"Enable pre-directory .vimrc
set exrc
set secure

"Enable folding based on indention
autocmd FileType * set foldmethod=indent "| normal zR
autocmd FileType ruby set foldmethod=syntax

"cleanup whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,html,elixir autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"Easier pane navigation
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>:redraw!<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>:redraw!<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>:redraw!<CR>
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>:redraw!<CR>

inoremap <C-Return> <CR><CR><C-o>k<Tab>
nmap ,d :b#<bar>bd#<CR>
nmap <C-n> :CtrlPBuffer<CR>

let g:ruby_debugger_progname = 'mvim'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
let g:ctrlp_custom_ignore = '(\v[\/]\.(DS_Store|git|hg|svn|optimized|compiled|node_modules)$)|(\v[\/]\_build$)'

au BufNewFile,BufRead *.erb,*.rhtml        setf eruby.html

function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" bind command-/ to toggle comment
" requires NERD Commenter to be installed: http://www.vim.org/scripts/script.php?script_id=1218
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>

" Make F2 open NERDTree
nmap <F2> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

:nnoremap <leader>q :Bdelete<CR>
:nnoremap <leader>o :only<CR>
:nnoremap <leader>l :redraw!<CR>
map <Leader>j !python -m json.tool<CR>

autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
autocmd BufReadPost fugitive://* set bufhidden=delete
