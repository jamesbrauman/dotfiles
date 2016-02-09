set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Quick start:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" run :PluginInstall to install or vim +PluginInstall +qall from command line
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mileszs/ack.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Bundle 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

syntax enable
syntax on
colorscheme solarized

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set statusline+=%F
set laststatus=2
set background=dark
set showcmd
set incsearch
set laststatus=2
set autowrite
set splitbelow
set splitright
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set textwidth=80
set colorcolumn=+1
set viminfo^=%
set modelines=0
set ttyfast
set scrolloff=5

" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:NERDTreeDirArrows=0

let g:user_emmet_leader_key='<C-E>'

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

command NT NERDTree

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

let javascript_enable_domhtmlcss = 1

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:lightline = {
  \ 'colorscheme': 'solarized'
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
