" Map leader to ,
let mapleader = ','

" Backspace deletes like most programs in insert mode
set backspace=2

" Choose no compatibility with legacy vi
set nocompatible

" Vundle
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tomtom/tcomment_vim'
Plugin 'duggiefresh/vim-easydir'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'merlinrebrovic/focus.vim'

call vundle#end() " required
filetype plugin indent on " required

" Enable syntax highlighting
syntax on
syntax enable

" Map exotic (unknown) extensions
au BufNewFile,BufRead *.axlsx set filetype=ruby

" Show current line number and realtive line numbers (hybrid)
set number
set relativenumber

" 1 tab == 2 spaces
set tabstop=2 shiftwidth=2

" soft tabs
set expandtab

" allow per project .vimrc's and disallow insecure per project stuff
set exrc
set secure

" Save with Ctrl+s
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>

" Editing ~/.vimrc file with ,v in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Don't clutter my dirs with swp and tmp files
set backupdir=~/.tmp
set directory=~/.tmp

" More logical split screen positions
set splitright
set splitbelow

" Easier window switching
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search by hitting ,f
nmap <leader>f :Ag<SPACE>

" Fuzzy finder: ignore stuff that can't be opened and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;coverage/**;tmp/**;rdoc/**;"

" Fix whitespace on save
au BufWritePre * StripWhitespace

" Improvements dependent on ag
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore node_modules
    \ --ignore bower_components
    \ --ignore tmp
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Vim test
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" puts the caller (https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html)
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>"

" hint to keep lines short
if exists('+colorcolumn')
  highlight ColorColumn  ctermbg=237
  set colorcolumn=80
endif

" Changes Ruby 1.9 hash rocket (=>) syntax to new columns syntax (:)
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

" Focus.vim
let g:focus_use_default_mapping = 0
nmap <leader>c <Plug>FocusModeToggle

" Got back to first character instead of going to start of line
nmap 0 ^

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall " Bind :Qall to qall
command! QA qall
