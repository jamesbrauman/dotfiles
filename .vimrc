" set vim compatability off to enable more features
set nocompatible

" turn filetype off before loading vundle
filetype off

" set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim

" initialize vundle
call vundle#begin()

Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rking/ag.vim'

" end vundle initialization
call vundle#end()

" turn filetype on
filetype plugin indent on

" enable syntax highlighting (defaults)
syntax enable

" enable syntax highlighting
syntax on

" set vim colorscheme
colorscheme solarized

" make sure the background is dark.
set background=dark

" make vim backspace over linebreaks too
set backspace=2

" disable vim backups
set nobackup

" disable writing backups
set nowritebackup

" dont use a swapfile
set noswapfile

" store 100 lines of history
set history=100

" dont show the mode, because we're using powerline anyway
set noshowmode

set statusline+=%F

" always show status below windows / tabs
set laststatus=2

" when doing a search, show where it matches as it is typed
set incsearch

" when making a horizontal split, show the new buffer below
set splitbelow

" make making a vertical split, show the new buffer to the right
set splitright

" a tab is worth two spaces
set tabstop=2

" use spaces instead of tabs
set expandtab

" auto indent should use two spaces
set shiftwidth=2

" make tabs smarter
set smarttab

" maximum width of text should be 80 characters
set textwidth=80

" add a color column one character after the textwidth
set colorcolumn=+1

" disable checking for modelines
set modelines=0

" improves smoothness of drawing
set ttyfast

" minimum number of screen lines to keep above and below cursor
set scrolloff=5

" disable the up arrow key in normal mode
noremap <Up> <NOP>

" disable the down arrow key in normal mode
noremap <Down> <NOP>

" disable the left arrow key in normal mode
noremap <Left> <NOP>

"disable the right arrow key in normal mode
noremap <Right> <NOP>

" disable arrows in nerdtree
let g:NERDTreeDirArrows=0

" set the emmet leader key to ctrl e
let g:user_emmet_leader_key='<C-E>'

" highlight currnet line when entering insert mode
autocmd InsertEnter * set cul

" disable highlighting current line when leaving insert mode
autocmd InsertLeave * set nocul

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Return to last edit position when opening files
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

" move around splits using vim keys while holding ctrl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" the command NT opens nerdtree
command NT NERDTree

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" enable css and html highlighting in js files
let javascript_enable_domhtmlcss = 1

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
  \ }

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
